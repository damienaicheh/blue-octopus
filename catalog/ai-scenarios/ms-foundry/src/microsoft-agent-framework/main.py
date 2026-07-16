"""Microsoft Agent Framework writer workflow, with
human-in-the-loop review.

Pipeline:

    ideator  ->  writer (Foundry Toolbox tools)  ->  [human review]  ->  proofreader

- ``ideator``     proposes 3 punchy angles for a LinkedIn post.
- ``writer``      picks the strongest angle and drafts the post, grounding it
                  with the Foundry Toolbox (Microsoft Learn MCP + web search).
- a ``Coordinator`` executor pauses after the writer and asks a human to review
  the draft. The human either replies ``approve`` (forward to the proofreader)
  or gives a short guidance note (loop back to the writer to revise).
- ``proofreader`` tightens the approved copy and appends exactly 3 hashtags.

The human review uses the Agent Framework request/response pattern:
``ctx.request_info(...)`` in the Coordinator emits a ``request_info`` event.
``workflow.as_agent()`` surfaces that event to the caller over the Responses
protocol as a ``function_call`` output item named ``request_info``. The caller
resumes by sending a ``function_call_output`` whose ``call_id`` matches that
item's ``call_id`` and whose ``output`` is the review answer (``approve`` or a
short guidance note).

"""

import os

import httpx
from agent_framework import (
    Agent,
    MCPStreamableHTTPTool,
    WorkflowBuilder,
)
from agent_framework.foundry import FoundryChatClient
from agent_framework_foundry_hosting import ResponsesHostServer
from auth.toolbox_auth import ToolboxAuth
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import PromptAgentDefinition
from azure.identity import DefaultAzureCredential, get_bearer_token_provider
from dotenv import load_dotenv
from executors.coordinator import Coordinator

load_dotenv()

_AZURE_AI_SCOPE = "https://ai.azure.com/.default"

IDEATOR_INSTRUCTIONS = (
    "You are an editorial ideator specialized in the Microsoft technology "
    "ecosystem (Azure, Microsoft Foundry, .NET, GitHub, Visual Studio, "
    "Microsoft 365, Power Platform, etc.). From the topic given by the user, "
    "propose 3 short and punchy angles for a LinkedIn post, always framed "
    "within the Microsoft technology context. If the topic is unrelated to "
    "Microsoft technologies, reframe it around the closest Microsoft offering. "
    "Reply as a bulleted list of 3 items, nothing else."
)
WRITER_INSTRUCTIONS = (
    "You are a copywriter specialized in the Microsoft technology ecosystem "
    "(Azure, Microsoft Foundry, .NET, GitHub, Visual Studio, Microsoft 365, "
    "Power Platform, etc.). Among the angles proposed previously, pick the "
    "strongest one and write an engaging LinkedIn post (4 to 6 sentences), "
    "strictly focused on the Microsoft technology context. "
    "Use your tools when they help: query the Microsoft Learn MCP tool to "
    "ground the post in accurate, up-to-date official documentation, and use "
    "web search to find recent announcements, blog posts, or release news. "
    "Only call a tool when it adds concrete value; otherwise answer directly. "
    "Call at most one tool per step and never request multiple tools in "
    "parallel; wait for a tool result before deciding on the next action."
)
PROOFREADER_INSTRUCTIONS = (
    "You are a proofreader for content about the Microsoft technology ecosystem. "
    "Improve the previous post: make it concise, fix the tone, ensure the "
    "content stays strictly within the Microsoft technology context, keep the "
    "product names accurate, and add exactly 3 relevant hashtags at the end. "
    "Return only the final version of the post."
)


def resolve_toolbox_endpoint(project_endpoint: str, toolbox_name: str) -> str:
    """Build the Foundry Toolbox MCP endpoint from the project endpoint + name."""
    project_endpoint = project_endpoint.rstrip("/")
    return f"{project_endpoint}/toolboxes/{toolbox_name}/mcp?api-version=v1"


def main() -> None:
    credential = DefaultAzureCredential()
    project_endpoint = os.environ["FOUNDRY_PROJECT_ENDPOINT"]
    model_name = os.environ["MODEL_DEPLOYMENT_NAME"]
    toolbox_name = os.environ["TOOLBOX_NAME"]

    # Register each agent as a Foundry prompt-agent version so it shows up in the
    # Foundry project (Build > Agents) and is reused by name.
    project = AIProjectClient(endpoint=project_endpoint, credential=credential)
    ideator_detail = project.agents.create_version(
        agent_name="agent-ideator-maf",
        definition=PromptAgentDefinition(
            model=model_name, instructions=IDEATOR_INSTRUCTIONS.strip()
        ),
    )
    writer_detail = project.agents.create_version(
        agent_name="agent-writer-maf",
        definition=PromptAgentDefinition(
            model=model_name, instructions=WRITER_INSTRUCTIONS.strip()
        ),
    )
    proofreader_detail = project.agents.create_version(
        agent_name="agent-proofreader-maf",
        definition=PromptAgentDefinition(
            model=model_name, instructions=PROOFREADER_INSTRUCTIONS.strip()
        ),
    )

    client = FoundryChatClient(
        project_endpoint=project_endpoint,
        model=model_name,
        credential=credential,
    )

    # Foundry Toolbox tools for the writer, reached over MCP. The tool connects on
    # first use; ToolboxAuth re-mints the bearer token on every request so a
    # long-lived agent keeps working after the initial token expires.
    token_provider = get_bearer_token_provider(credential, _AZURE_AI_SCOPE)
    toolbox = MCPStreamableHTTPTool(
        name=toolbox_name,
        url=resolve_toolbox_endpoint(project_endpoint, toolbox_name),
        http_client=httpx.AsyncClient(auth=ToolboxAuth(token_provider), timeout=120.0),
        load_prompts=False,
    )

    # Local agents bound to the registered Foundry versions by name; the writer
    # additionally gets the toolbox tools for grounding.
    ideator = Agent(name=ideator_detail.name, client=client)
    writer = Agent(name=writer_detail.name, client=client, tools=toolbox)
    proofreader = Agent(name=proofreader_detail.name, client=client)

    coordinator = Coordinator(
        id="coordinator",
        writer_name=writer.name,  # type: ignore[arg-type]
        proofreader_name=proofreader.name,  # type: ignore[arg-type]
    )

    # ideator -> writer -> coordinator -> (writer to revise | proofreader to finish).
    # Only the proofreader's polished post is surfaced to the caller.
    workflow_agent = (
        WorkflowBuilder(start_executor=ideator, output_executors=[proofreader])
        .add_edge(ideator, writer)
        .add_edge(writer, coordinator)
        .add_edge(coordinator, writer)
        .add_edge(coordinator, proofreader)
        .build()
        .as_agent()
    )

    ResponsesHostServer(workflow_agent).run()


if __name__ == "__main__":
    main()
