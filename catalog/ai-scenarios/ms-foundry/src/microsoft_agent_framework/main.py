import asyncio
import logging
import os

from agent_framework import Agent
from agent_framework.foundry import FoundryChatClient
from agent_framework_foundry_hosting import ResponsesHostServer
from azure.ai.projects.aio import AIProjectClient
from azure.ai.projects.models import PromptAgentDefinition
from azure.identity.aio import DefaultAzureCredential
from dotenv import load_dotenv


def main() -> None:
    load_dotenv()
    logging.basicConfig(level=logging.INFO, format="%(message)s")
    logger = logging.getLogger(__name__)

    project_endpoint = os.environ["FOUNDRY_PROJECT_ENDPOINT"]
    model_deployment = os.environ["MODEL_DEPLOYMENT_NAME"]

    credential = DefaultAzureCredential()

    async def register_agent_version() -> tuple[str, str]:
        async with AIProjectClient(
            endpoint=project_endpoint,
            credential=credential,
        ) as project:
            agent_detail = await project.agents.create_version(
                agent_name="Orchestrator",
                definition=PromptAgentDefinition(
                    model=model_deployment,
                    instructions="""
                            You are a helpful assistant with advanced reasoning capabilities.
                            You must only use the provided context from the knowledge base to answer the questions.
                        """,
                ),
            )
            return (
                getattr(agent_detail, "name", "Orchestrator"),
                str(getattr(agent_detail, "version", "unknown")),
            )

    logger.info("Ensuring Orchestrator agent is registered in Foundry...")
    agent_name, agent_version = asyncio.run(register_agent_version())
    logger.info(
        "Foundry agent version created: %s (version %s)",
        agent_name,
        agent_version,
    )

    foundry_client = FoundryChatClient(
        project_endpoint=project_endpoint,
        model=model_deployment,
        credential=credential,
    )

    agent = Agent(
        name=agent_name,
        client=foundry_client,
    )

    server = ResponsesHostServer(agent)
    server.run()


if __name__ == "__main__":
    main()
