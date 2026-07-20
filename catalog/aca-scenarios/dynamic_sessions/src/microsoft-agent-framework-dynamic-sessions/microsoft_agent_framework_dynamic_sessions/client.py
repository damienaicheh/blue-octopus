"""Low-level Azure Dynamic Sessions client."""

from __future__ import annotations

import json
import os
import re
import threading
import urllib.parse
from dataclasses import dataclass
from io import BytesIO
from typing import BinaryIO, Callable
from uuid import uuid4

import requests

from .auth import default_access_token_provider

_PYTHON_EXECUTE_API_VERSION = "2024-02-02-preview"
_FILES_API_VERSION = "2025-02-02-preview"
_SESSION_DELETE_API_VERSION = "2025-10-02-preview"


@dataclass(slots=True)
class RemoteFileMetadata:
    """Metadata for a file in an Azure Dynamic Session."""

    filename: str
    size_in_bytes: int

    @property
    def full_path(self) -> str:
        return f"/mnt/data/{self.filename}"


class DynamicSessionsClient:
    """HTTP client for Azure Container Apps Dynamic Sessions."""

    def __init__(
        self,
        *,
        pool_management_endpoint: str,
        access_token_provider: Callable[[], str] | None = None,
        session_id: str | None = None,
        timeout_seconds: float = 120.0,
    ) -> None:
        self.pool_management_endpoint = pool_management_endpoint
        self.access_token_provider = (
            access_token_provider or default_access_token_provider()
        )
        self.timeout_seconds = timeout_seconds
        self._session_id = session_id or str(uuid4())
        self._session_id_lock = threading.Lock()

    @property
    def session_id(self) -> str:
        with self._session_id_lock:
            return self._session_id

    def _build_url(
        self, *, path: str, api_version: str, session_id: str | None = None
    ) -> str:
        endpoint = self.pool_management_endpoint
        if not endpoint:
            raise ValueError("pool_management_endpoint is not set")
        if not endpoint.endswith("/"):
            endpoint = f"{endpoint}/"
        sid = urllib.parse.quote(session_id or self.session_id)
        query_sep = "&" if "?" in endpoint else "?"
        return f"{endpoint}{path}{query_sep}identifier={sid}&api-version={api_version}"

    def _headers(self) -> dict[str, str]:
        token = self.access_token_provider()
        return {
            "Authorization": f"Bearer {token}",
            "User-Agent": "microsoft-agent-framework-dynamic-sessions/0.1.0",
        }

    def execute_python(self, python_code: str, *, sanitize_input: bool = True) -> dict:
        if sanitize_input:
            python_code = self._sanitize_python_input(python_code)

        response = requests.post(
            self._build_url(
                path="code/execute", api_version=_PYTHON_EXECUTE_API_VERSION
            ),
            headers={**self._headers(), "Content-Type": "application/json"},
            json={
                "properties": {
                    "codeInputType": "inline",
                    "executionType": "synchronous",
                    "code": python_code,
                }
            },
            timeout=self.timeout_seconds,
        )
        response.raise_for_status()
        return response.json().get("properties", {})

    def upload_file(
        self,
        *,
        remote_file_path: str | None = None,
        local_file_path: str | None = None,
        data: BinaryIO | None = None,
    ) -> RemoteFileMetadata:
        if data and local_file_path:
            raise ValueError("Provide either data or local_file_path, not both")
        if not data and not local_file_path:
            raise ValueError("Either data or local_file_path must be provided")

        if local_file_path:
            if remote_file_path is None:
                remote_file_path = os.path.basename(local_file_path)
            with open(local_file_path, "rb") as file_obj:
                return self._upload_file_with_data(
                    remote_file_path=remote_file_path, file_data=file_obj
                )

        assert data is not None
        if remote_file_path is None:
            raise ValueError(
                "remote_file_path is required when uploading from in-memory data"
            )
        return self._upload_file_with_data(
            remote_file_path=remote_file_path, file_data=data
        )

    def _upload_file_with_data(
        self, *, remote_file_path: str, file_data: BinaryIO
    ) -> RemoteFileMetadata:
        response = requests.post(
            self._build_url(path="files", api_version=_FILES_API_VERSION)
            + "&path=/mnt/data",
            headers=self._headers(),
            data={},
            files=[("file", (remote_file_path, file_data, "application/octet-stream"))],
            timeout=self.timeout_seconds,
        )
        response.raise_for_status()
        payload = response.json()
        return RemoteFileMetadata(
            filename=payload.get("name", remote_file_path),
            size_in_bytes=payload.get("sizeInBytes", 0),
        )

    def download_file(
        self, *, remote_file_path: str, local_file_path: str | None = None
    ) -> BinaryIO:
        encoded_remote_file = urllib.parse.quote(remote_file_path)
        response = requests.get(
            self._build_url(
                path=f"files/{encoded_remote_file}/content",
                api_version=_FILES_API_VERSION,
            ),
            headers=self._headers(),
            timeout=self.timeout_seconds,
        )
        response.raise_for_status()

        if local_file_path:
            with open(local_file_path, "wb") as file_obj:
                file_obj.write(response.content)

        return BytesIO(response.content)

    def list_files(self) -> list[RemoteFileMetadata]:
        response = requests.get(
            self._build_url(path="files", api_version=_FILES_API_VERSION),
            headers=self._headers(),
            timeout=self.timeout_seconds,
        )
        response.raise_for_status()

        payload = response.json().get("value", [])
        return [
            RemoteFileMetadata(
                filename=entry.get("name", ""),
                size_in_bytes=entry.get("sizeInBytes", 0),
            )
            for entry in payload
        ]

    def delete_session(self) -> None:
        with self._session_id_lock:
            session_id_to_delete = self._session_id
            self._session_id = str(uuid4())

        thread = threading.Thread(
            target=self._delete_session_sync,
            kwargs={"session_id": session_id_to_delete},
            daemon=True,
        )
        thread.start()

    def _delete_session_sync(self, *, session_id: str) -> None:
        response = requests.delete(
            self._build_url(
                path="session",
                api_version=_SESSION_DELETE_API_VERSION,
                session_id=session_id,
            ),
            headers=self._headers(),
            timeout=self.timeout_seconds,
        )
        response.raise_for_status()

    @staticmethod
    def _sanitize_python_input(query: str) -> str:
        query = re.sub(r"^(\\s|`)*(?i:python)?\\s*", "", query)
        query = re.sub(r"(\\s|`)*$", "", query)
        return query
