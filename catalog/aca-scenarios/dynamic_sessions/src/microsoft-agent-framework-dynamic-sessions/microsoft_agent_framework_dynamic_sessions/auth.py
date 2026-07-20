"""Authentication helpers for Azure Dynamic Sessions."""

from __future__ import annotations

from datetime import datetime, timedelta, timezone
from typing import Callable

from azure.core.credentials import AccessToken
from azure.identity import DefaultAzureCredential

_DYNAMIC_SESSIONS_SCOPE = "https://dynamicsessions.io/.default"


def default_access_token_provider(
    scope: str = _DYNAMIC_SESSIONS_SCOPE,
) -> Callable[[], str]:
    """Return a cached token provider for the given Entra scope."""
    credential = DefaultAzureCredential()
    token: AccessToken | None = None

    def provider() -> str:
        nonlocal token
        now = datetime.now(timezone.utc)
        if token is None or datetime.fromtimestamp(
            token.expires_on, timezone.utc
        ) <= now + timedelta(minutes=5):
            token = credential.get_token(scope)
        return token.token

    return provider
