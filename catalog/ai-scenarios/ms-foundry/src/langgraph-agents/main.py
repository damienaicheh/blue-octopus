# Copyright (c) Microsoft. All rights reserved.

from __future__ import annotations

import os

from azure.identity import DefaultAzureCredential
from dotenv import load_dotenv
from langchain_azure_ai.agents import AgentServiceFactory
from langchain_azure_ai.agents.hosting import ResponsesHostServer
from langchain_azure_ai.callbacks.tracers import AzureAIOpenTelemetryTracer
from langchain_core.messages import HumanMessage
from langgraph.checkpoint.memory import MemorySaver
from langgraph.graph import START, MessagesState, StateGraph

load_dotenv()

IDEATOR = "ideator"
WRITER = "writer"
PROOFREADER = "proofreader"
HANDOFF_TO_WRITER = "handoff_to_writer"
HANDOFF_TO_PROOFREADER = "handoff_to_proofreader"

IDEATOR_INSTRUCTIONS = (
    "You are an editorial ideator. From the topic given by the user, propose 3 "
    "short and punchy angles for a LinkedIn post. Reply as a bulleted list of 3 "
    "items, nothing else."
)
WRITER_INSTRUCTIONS = (
    "You are a copywriter. Among the angles proposed previously, pick the "
    "strongest one and write an engaging LinkedIn post (4 to 6 sentences)."
)
PROOFREADER_INSTRUCTIONS = (
    "You are a proofreader. Improve the previous post: make it concise, fix the "
    "tone, and add exactly 3 relevant hashtags at the end. Return only the final "
    "version of the post."
)


def handoff(state: MessagesState) -> dict:
    """Turn the previous agent's answer into the next agent's input.

    Each ResponsesAgentNode only reads the last message and expects a
    HumanMessage, so we re-wrap the preceding AIMessage as a HumanMessage.
    """
    last = state["messages"][-1]
    return {"messages": [HumanMessage(content=last.content)]}


def main() -> None:
    project_endpoint = os.environ["FOUNDRY_PROJECT_ENDPOINT"].rstrip("/")
    deployment = os.environ["MODEL_DEPLOYMENT_NAME"]

    factory = AgentServiceFactory(
        project_endpoint=project_endpoint,
        credential=DefaultAzureCredential(),
    )

    ideator_node = factory.create_prompt_agent_node(
        name=IDEATOR,
        model=deployment,
        instructions=IDEATOR_INSTRUCTIONS,
    )
    writer_node = factory.create_prompt_agent_node(
        name=WRITER,
        model=deployment,
        instructions=WRITER_INSTRUCTIONS,
    )
    proofreader_node = factory.create_prompt_agent_node(
        name=PROOFREADER,
        model=deployment,
        instructions=PROOFREADER_INSTRUCTIONS,
    )

    workflow = StateGraph(MessagesState).add_sequence(
        [
            (IDEATOR, ideator_node),
            (HANDOFF_TO_WRITER, handoff),
            (WRITER, writer_node),
            (HANDOFF_TO_PROOFREADER, handoff),
            (PROOFREADER, proofreader_node),
        ]
    )
    workflow.add_edge(START, IDEATOR)

    # Sends OpenTelemetry spans for every LangGraph node to the Application
    # Insights resource connected to the Foundry project. We pass the connection
    # string explicitly (from APPLICATION_INSIGHTS_CONNECTION_STRING) to avoid
    # the project telemetry auto-resolution returning a malformed value.
    tracer = AzureAIOpenTelemetryTracer(
        project_endpoint=project_endpoint,
        credential=DefaultAzureCredential(),
        connection_string=os.environ["APPLICATION_INSIGHTS_CONNECTION_STRING"],
        name="langgraph-hosted-agent-sample",
        trace_all_langgraph_nodes=True,
    )

    graph = workflow.compile(checkpointer=MemorySaver()).with_config(
        {"callbacks": [tracer]}
    )

    port = int(os.environ.get("PORT", "8088"))
    ResponsesHostServer(graph).run(port=port)


if __name__ == "__main__":
    main()
