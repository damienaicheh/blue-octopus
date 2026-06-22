import os

from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import PromptAgentDefinition
from azure.identity import (
    AzureCliCredential,
    AzureDeveloperCliCredential,
    ChainedTokenCredential,
)
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

foundry_project_endpoint: str = os.environ["FOUNDRY_PROJECT_ENDPOINT"]
foundry_model_name: str = os.getenv("FOUNDRY_MODEL_NAME", "gpt-5.4-mini")
### Foundry connection name in the Terraform script
foundry_model_gateway_connection_name: str = os.getenv(
    "FOUNDRY_MODEL_GATEWAY_CONNECTION_NAME", "ai-gateway"
)

agent_id = None

credential = ChainedTokenCredential(
    AzureCliCredential(),
    AzureDeveloperCliCredential(),
)

project_client = AIProjectClient(
    endpoint=foundry_project_endpoint,
    credential=credential,
)

### Set the model deployment name environment variable
### The model name is now a path format of {model_gateway_connection}/{model_name} - only usable from SDK atm
model = f"{foundry_model_gateway_connection_name}/{foundry_model_name}"

joke_agent = project_client.agents.create_version(
    agent_name="my-test-agent",
    definition=PromptAgentDefinition(
        model=model, instructions="you are a helpful but sarcastic assistant."
    ),
)
print(
    f"V2 Agent created (id: {joke_agent.id}, name: {joke_agent.name}, version: {joke_agent.version})"
)

agents = project_client.agents.list()
print(f"\n📋 List of agents in project '{foundry_project_endpoint}':")
for agent in agents:
    print(f"- {agent.name} (id: {agent.id})")


openai_client = project_client.get_openai_client()

# it's not required but helps with the traceability of conversations in the logs to have a conversation id, especially when testing with multiple requests.
conversation_id = openai_client.conversations.create().id

# Reference the agent to get a response
response = openai_client.responses.create(
    input=[
        {
            "role": "user",
            "content": "Tell me what you can help with. and tell me a funny short joke.",
        }
    ],
    conversation=conversation_id,
    extra_body={
        "agent_reference": {"name": joke_agent.name, "type": "agent_reference"}
    },
)

print(f"📝 Response: {response.output_text}")
