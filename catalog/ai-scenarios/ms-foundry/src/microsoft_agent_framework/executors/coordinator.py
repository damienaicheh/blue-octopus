import hashlib
from dataclasses import asdict

from agent_framework import (
    AgentExecutorRequest,
    AgentExecutorResponse,
    AgentResponse,
    Executor,
    Message,
    WorkflowContext,
    handler,
    response_handler,
)
from models.draft_review_request import DraftReviewRequest
from typing_extensions import Never


class Coordinator(Executor):
    """Bridges the writer, the human reviewer, and the proofreader.

    After the writer produces a draft it flows here; the Coordinator asks a human
    to review it. On ``approve`` the draft goes to the proofreader; otherwise the
    reviewer's note is appended and the writer is asked to revise, looping until
    the human approves.
    """

    def __init__(self, id: str, writer_name: str, proofreader_name: str) -> None:
        super().__init__(id)
        self.writer_name = writer_name
        self.proofreader_name = proofreader_name

    @handler
    async def on_draft(
        self,
        draft: AgentExecutorResponse,
        ctx: WorkflowContext[Never, AgentResponse],
    ) -> None:
        """Pause on the writer's draft and request human review."""
        draft_text = draft.agent_response.text
        prompt = (
            "Review the drafted LinkedIn post. Reply 'approve' to accept it as-is, "
            "or give a short directional note (tone, must-have detail, audience). "
            "Keep any note under 30 words."
        )
        # Use a deterministic request id derived from the draft. The Foundry
        # hosting resumes by restoring the latest checkpoint and replaying this
        # handler; with a random uuid the replayed request would get a new id and
        # no longer match the call_id already returned to the caller (causing
        # "unknown request ID" on approve). Hashing the draft keeps the id stable
        # across restore, while a revised draft naturally yields a fresh id.
        review_id = "review-" + hashlib.sha256(draft_text.encode()).hexdigest()[:16]
        # Build the payload with the typed dataclass for readability, but hand it
        # to request_info as a plain dict. The Foundry hosting persists request
        # data inside the pending-request checkpoint and restores it with a narrow
        # allowlist (allowed_checkpoint_types); a custom type would be blocked on
        # the hosted platform ("Checkpoint deserialization blocked for type ..."),
        # so the request_info would never surface and nothing appears in the
        # playground. A built-in dict round-trips safely.
        review_request = DraftReviewRequest(prompt=prompt, draft=draft_text)
        await ctx.request_info(
            request_data=asdict(review_request),
            response_type=str,
            request_id=review_id,
        )

    @response_handler
    async def on_review(
        self,
        original_request: dict,
        feedback: str,
        ctx: WorkflowContext[AgentExecutorRequest],
    ) -> None:
        """Route the human's answer: approve -> proofreader, else -> writer revise."""
        note = feedback.strip()
        # Rebuild the typed view from the dict that was stored in the checkpoint.
        review_request = DraftReviewRequest(**original_request)
        draft = review_request.draft
        if note.lower() == "approve":
            # Hand off only the final draft to the proofreader, mirroring the
            # LangGraph port: the writer's tool-call history is not re-sent.
            await ctx.send_message(
                AgentExecutorRequest(
                    messages=[Message("user", contents=[draft])],
                    should_respond=True,
                ),
                target_id=self.proofreader_name,
            )
            return

        # Loop back to the writer with only the current draft plus the feedback,
        # again matching the LangGraph port to avoid resending the full context.
        instruction = (
            "Revise the following LinkedIn post based on the feedback.\n\n"
            f"Post:\n{draft}\n\nFeedback: {note}"
        )
        await ctx.send_message(
            AgentExecutorRequest(
                messages=[Message("user", contents=[instruction])],
                should_respond=True,
            ),
            target_id=self.writer_name,
        )
