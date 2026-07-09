#!/usr/bin/env bash

# --- Configuration (passed via command line) ---
# Usage: ./deploy.sh <acr-name> <foundry-project-endpoint>
ACR_NAME="$1"
FOUNDRY_PROJECT_ENDPOINT="$2"
AGENT_NAME=writer-workflow-lg

if [ -z "$ACR_NAME" ] || [ -z "$FOUNDRY_PROJECT_ENDPOINT" ]; then
  echo "Usage: $0 <acr-name> <foundry-project-endpoint>" >&2
  exit 1
fi

IMAGE_TAG="${AGENT_NAME}:v1"
IMAGE="${ACR_NAME}.azurecr.io/${IMAGE_TAG}"

# Foundry User built-in role. It grants the data-plane actions (including
# agents/write) the container needs to create agent versions at startup.
FOUNDRY_USER_ROLE_ID="53ca6127-db72-4b80-b1b0-d745d6d5456d"

# --- Build and push the container image to ACR ---
az acr login --name "$ACR_NAME"
az acr build --registry "$ACR_NAME" --image "$IMAGE_TAG" ../langgraph-agents

echo "##### Successfully built and pushed the image to ACR: $IMAGE #####"

# --- Resolve the Foundry account ARM scope (role assignment target) ---
# The account name is embedded in the project endpoint; the account ARM id is
# derived from it. Telemetry is handled by the platform, so no App Insights
# connection string is passed here.
ACCOUNT_NAME=$(echo "$FOUNDRY_PROJECT_ENDPOINT" | sed -E 's#^https://([^.]+)\..*#\1#')
ACCOUNT_SCOPE=$(az cognitiveservices account list --query "[?name=='$ACCOUNT_NAME'].id | [0]" -o tsv)

# --- Create (or update) the hosted agent from the image ---
TOKEN=$(az account get-access-token --resource https://ai.azure.com --query accessToken -o tsv)

AGENT_JSON=$(curl -s -X POST "$FOUNDRY_PROJECT_ENDPOINT/agents?api-version=v1" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d @- <<EOF
{
  "name": "$AGENT_NAME",
  "definition": {
    "kind": "hosted",
    "container_configuration": {
      "image": "$IMAGE"
    },
    "cpu": "1",
    "memory": "2Gi",
    "protocol_versions": [
      {"protocol": "responses", "version": "1.0.0"}
    ],
    "environment_variables": {
      "MODEL_DEPLOYMENT_NAME": "gpt-5.4",
      "TOOLBOX_NAME": "linkedin-writer-tools"
    }
  }
}
EOF
)

echo "##### Successfully created the hosted agent #####"

# --- Grant the agent's managed identity permission to create agents ---
# The deployment response carries the agent's managed identity. Read its
# principal id with jq and grant it the Foundry User role so the container can
# create agent versions at startup.
AGENT_PRINCIPAL_ID=$(echo "$AGENT_JSON" | jq -r '.instance_identity.principal_id // empty')

if [ -z "$AGENT_PRINCIPAL_ID" ]; then
  echo "ERROR: could not read the agent identity from the deployment response." >&2
  echo "$AGENT_JSON" >&2
  exit 1
fi

# Assign the Foundry User role on the Foundry account scope (resolved above).
az role assignment create \
  --role "$FOUNDRY_USER_ROLE_ID" \
  --assignee-object-id "$AGENT_PRINCIPAL_ID" \
  --assignee-principal-type ServicePrincipal \
  --scope "$ACCOUNT_SCOPE"

echo "##### Successfully granted the Foundry User role to the agent's managed identity #####"