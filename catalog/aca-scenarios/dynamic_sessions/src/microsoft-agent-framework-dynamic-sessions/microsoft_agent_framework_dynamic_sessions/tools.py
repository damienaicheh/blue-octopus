"""Agent Framework tools backed by Azure Dynamic Sessions."""

from __future__ import annotations

import json
import os
from copy import deepcopy
from pathlib import Path
from typing import Annotated, Callable

from agent_framework import tool

from .client import DynamicSessionsClient


class DynamicSessionsPythonTool:
    """Factory-style wrapper that exposes a `FunctionTool` for Python execution."""

    def __init__(
        self,
        *,
        pool_management_endpoint: str,
        access_token_provider: Callable[[], str] | None = None,
        delete_session_after_invocation: bool = False,
        output_directory: str | os.PathLike[str] | None = None,
    ) -> None:
        self._client = DynamicSessionsClient(
            pool_management_endpoint=pool_management_endpoint,
            access_token_provider=access_token_provider,
        )
        self._delete_session_after_invocation = delete_session_after_invocation
        self._output_directory = (
            Path(output_directory) if output_directory is not None else None
        )

    @tool(
        name="Python_REPL",
        description=(
            "A Python shell running on Azure Dynamic Sessions. "
            "Use it for calculations, code execution, and data transformations. "
            "Input must be valid Python code."
        ),
    )
    def python_repl(self, input: str) -> str:
        try:
            response = self._client.execute_python(input)
            result = deepcopy(response.get("result"))
            if (
                isinstance(result, dict)
                and result.get("type") == "image"
                and "base64_data" in result
            ):
                result.pop("base64_data")
            return json.dumps(
                {
                    "result": result,
                    "stdout": response.get("stdout"),
                    "stderr": response.get("stderr"),
                },
                indent=2,
            )
        finally:
            if self._delete_session_after_invocation:
                self._client.delete_session()

    @tool(
        name="List_Session_Files",
        description=(
            "List the files currently available in the Azure Dynamic Session "
            "working directory (/mnt/data). "
            "Returns each file name along with its size in bytes."
        ),
    )
    def list_files(self) -> str:
        files = self._client.list_files()
        return json.dumps(
            [
                {"filename": file.filename, "size_in_bytes": file.size_in_bytes}
                for file in files
            ],
            indent=2,
        )

    @tool(
        name="Download_Session_File",
        description=(
            "Download a file from the Azure Dynamic Session working directory "
            "(/mnt/data) to the local output folder so it can be inspected. "
            "Provide the remote file name. Returns the local path where the file "
            "was saved, plus the content as text when it is UTF-8 decodable."
        ),
    )
    def download_file(
        self,
        remote_file_path: Annotated[
            str, "The name of the file to download from /mnt/data."
        ],
    ) -> str:
        buffer = self._client.download_file(remote_file_path=remote_file_path)
        content = buffer.read()

        result: dict[str, object] = {
            "filename": os.path.basename(remote_file_path),
            "size_in_bytes": len(content),
        }

        if self._output_directory is not None:
            self._output_directory.mkdir(parents=True, exist_ok=True)
            # Only keep the base name to prevent writing outside the output folder.
            local_path = self._output_directory / os.path.basename(remote_file_path)
            local_path.write_bytes(content)
            result["local_path"] = str(local_path.resolve())

        try:
            result["content"] = content.decode("utf-8")
        except UnicodeDecodeError:
            result["note"] = "Binary file content cannot be displayed as text."

        return json.dumps(result, indent=2)

    @property
    def client(self) -> DynamicSessionsClient:
        return self._client

    def close(self) -> None:
        self._client.delete_session()
