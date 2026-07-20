"""Agent Framework tools backed by Azure Dynamic Sessions."""

from __future__ import annotations

import json
from copy import deepcopy
from typing import Callable

from agent_framework import FunctionTool, tool

from .client import DynamicSessionsClient


class DynamicSessionsPythonTool:
    """Factory-style wrapper that exposes a `FunctionTool` for Python execution."""

    def __init__(
        self,
        *,
        pool_management_endpoint: str,
        access_token_provider: Callable[[], str] | None = None,
        delete_session_after_invocation: bool = False,
    ) -> None:
        self._client = DynamicSessionsClient(
            pool_management_endpoint=pool_management_endpoint,
            access_token_provider=access_token_provider,
        )
        self._delete_session_after_invocation = delete_session_after_invocation

        @tool(
            name="Python_REPL",
            description=(
                "A Python shell running on Azure Dynamic Sessions. "
                "Use it for calculations, code execution, and data transformations. "
                "Input must be valid Python code."
            ),
        )
        def python_repl(input: str) -> str:
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

        self.tool: FunctionTool = python_repl

    @property
    def client(self) -> DynamicSessionsClient:
        return self._client

    def close(self) -> None:
        self._client.delete_session()
