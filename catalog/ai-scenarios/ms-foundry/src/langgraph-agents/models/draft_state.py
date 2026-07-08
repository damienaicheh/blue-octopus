from typing import TypedDict

from langchain_core.messages import BaseMessage
from langgraph.graph.message import add_messages
from typing_extensions import Annotated


class DraftState(TypedDict):
    """Graph state.

    ``messages`` is the channel the Responses host reads — only the
    final approved draft is appended to it. ``draft`` holds the current
    proposal text, and ``revision_history`` accumulates prior drafts
    with the feedback that prompted each revision.
    """

    messages: Annotated[list[BaseMessage], add_messages]
    draft: str
    revision_history: list[dict]
