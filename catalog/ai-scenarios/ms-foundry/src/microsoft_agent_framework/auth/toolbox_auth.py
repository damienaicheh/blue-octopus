import httpx


class ToolboxAuth(httpx.Auth):
    """Injects a fresh Entra bearer token on every toolbox MCP request."""

    def __init__(self, token_provider):
        self._get_token = token_provider

    def auth_flow(self, request):
        request.headers["Authorization"] = f"Bearer {self._get_token()}"
        yield request
