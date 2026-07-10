# Copyright (c) Microsoft. All rights reserved.

"""One-time setup: create a Foundry toolbox version with tools.

Microsoft Learn is a public MCP server, so it needs no project connection.
Web Search uses Grounding with Bing Search and also needs no project connection.
GitHub Copilot's MCP server requires authentication (a ``CustomKeys`` project
connection holding a PAT). Add it back below once that connection exists in the
Foundry project.
"""

from __future__ import annotations

import logging
import os
from typing import cast

from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import MCPTool, ToolboxTool, WebSearchTool
from azure.identity import DefaultAzureCredential
from dotenv import load_dotenv

load_dotenv()


def main() -> None:
    logger = logging.getLogger(__name__)
    logger.setLevel(logging.INFO)

    project_endpoint = os.environ["FOUNDRY_PROJECT_ENDPOINT"].rstrip("/")
    toolbox_name = os.environ.get("TOOLBOX_NAME", "linkedin-writer-tools")

    project = AIProjectClient(
        endpoint=project_endpoint,
        credential=DefaultAzureCredential(),
    )

    toolbox_version = project.toolboxes.create_version(
        name=toolbox_name,
        description="Microsoft Learn MCP server and web search for the writer.",
        tools=cast(
            "list[ToolboxTool]",
            [
                MCPTool(
                    server_label="microsoftlearn",
                    server_url="https://learn.microsoft.com/api/mcp",
                    require_approval="never",
                ),
                WebSearchTool(),
            ],
        ),
    )

    # Creating a new version does not auto-promote it (only the very first
    # version is default), so make this version the one the endpoint serves.
    project.toolboxes.update(
        toolbox_name,
        default_version=toolbox_version.version,
    )

    logger.info(
        f"Created toolbox '{toolbox_version.name}', "
        f"version {toolbox_version.version} (now default)."
    )


if __name__ == "__main__":
    main()
