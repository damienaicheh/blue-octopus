"""LangChain tools backed by Azure Dynamic Sessions."""

from __future__ import annotations

import json
import os
import urllib.request
from datetime import datetime, timezone

from langchain_azure_dynamic_sessions import SessionsPythonREPLTool
from langchain_core.tools import StructuredTool


class DynamicSessionsToolset:
    """Bundle the tools an agent uses to run code in Azure Dynamic Sessions."""

    def __init__(
        self,
        *,
        pool_management_endpoint: str,
        output_directory: str | os.PathLike[str],
    ) -> None:
        self._output_directory = os.fspath(output_directory)
        self._repl_tool = SessionsPythonREPLTool(
            pool_management_endpoint=pool_management_endpoint
        )

        self.python_repl = self._repl_tool
        self.fetch_stock_closes = StructuredTool.from_function(
            self._fetch_stock_closes,
            name="fetch_stock_closes",
            description=(
                "Fetch recent daily closing prices for a stock ticker (e.g. "
                "MSFT, AAPL, GOOGL) from Yahoo Finance. Returns CSV text with "
                "columns 'date,close'. Runs on the host (which has internet), "
                "so use it to obtain market data before charting."
            ),
        )
        self.list_files = StructuredTool.from_function(
            self._list_files,
            name="List_Session_Files",
            description=(
                "List the files currently available in the Azure Dynamic "
                "Session working directory (/mnt/data). Returns each file name "
                "with its size in bytes."
            ),
        )
        self.download_file = StructuredTool.from_function(
            self._download_file,
            name="Download_Session_File",
            description=(
                "Download a file from the Azure Dynamic Session working "
                "directory (/mnt/data) to the local output folder. Provide the "
                "remote file name. Returns the local path where the file was "
                "saved."
            ),
        )

    def _fetch_stock_closes(
        self, ticker: str, time_range: str = "1mo", interval: str = "1d"
    ) -> str:
        """Return daily (date, close) rows for a ticker as CSV text."""
        url = (
            f"https://query1.finance.yahoo.com/v8/finance/chart/{ticker}"
            f"?range={time_range}&interval={interval}"
        )
        request = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
        with urllib.request.urlopen(request, timeout=20) as response:
            payload = json.load(response)

        result = payload["chart"]["result"][0]
        timestamps = result["timestamp"]
        closes = result["indicators"]["quote"][0]["close"]

        lines = ["date,close"]
        for ts, close in zip(timestamps, closes):
            if close is None:
                continue
            day = datetime.fromtimestamp(ts, tz=timezone.utc).strftime("%Y-%m-%d")
            lines.append(f"{day},{close:.2f}")
        return "\n".join(lines)

    def _list_files(self) -> str:
        """List the files available in the session working directory."""
        files = self._repl_tool.list_files()
        return json.dumps(
            [{"filename": f.filename, "size_in_bytes": f.size_in_bytes} for f in files],
            indent=2,
        )

    def _download_file(self, remote_file_path: str) -> str:
        """Download a session file into the local output folder."""
        os.makedirs(self._output_directory, exist_ok=True)
        # Only keep the base name to prevent writing outside the output folder.
        local_path = os.path.join(
            self._output_directory, os.path.basename(remote_file_path)
        )
        buffer = self._repl_tool.download_file(
            remote_file_path=remote_file_path, local_file_path=local_path
        )
        content = buffer.read()
        return json.dumps(
            {
                "filename": os.path.basename(remote_file_path),
                "size_in_bytes": len(content),
                "local_path": os.path.abspath(local_path),
            },
            indent=2,
        )
