from dataclasses import dataclass


@dataclass
class DraftReviewRequest:
    """Payload sent to the human reviewer when the writer's draft is ready.

    Kept as a typed dataclass for readability (add new fields here), but it is
    serialized to a plain ``dict`` before being handed to ``ctx.request_info``:
    the Foundry hosting persists request data inside the pending-request
    checkpoint and restores it with a narrow ``allowed_checkpoint_types``
    allowlist, which blocks arbitrary custom types on the hosted platform.
    Storing a built-in ``dict`` avoids that block while keeping this typed view
    on both ends via ``dataclasses.asdict`` / ``DraftReviewRequest(**data)``.
    """

    prompt: str = ""
    draft: str = ""
