# microsoft-agent-framework-dynamic-sessions

This package provides Azure Container Apps Dynamic Sessions tools for Microsoft Agent Framework.

## Features

- Python code execution tool (`Python_REPL`)
- Session lifecycle support (rotation and asynchronous deletion)
- File operations (upload, download, list)
- Entra ID authentication via `DefaultAzureCredential`

## Installation

```bash
uv sync
```

## Usage

```python
from microsoft_agent_framework_dynamic_sessions import DynamicSessionsPythonTool

tool = DynamicSessionsPythonTool(
    pool_management_endpoint="https://<your-session-pool-endpoint>/",
)

# pass `tool.tool` to an Agent Framework Agent
```
