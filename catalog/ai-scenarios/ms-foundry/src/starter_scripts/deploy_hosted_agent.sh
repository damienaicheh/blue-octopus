#!/usr/bin/env bash

# ---------------------------------------------------------------------------
# Shared build + deploy logic for a Foundry hosted agent.
#
# Do NOT run this directly. The per-agent wrappers set the agent-specific
# variables and then call this script:
#   - deploy_langgraph_agents.sh
#   - deploy_microsoft_agent_framework.sh
#
# Required environment variables (set by the calling wrapper):
#   AGENT_NAME   Name of the hosted agent (e.g. writer-workflow-lg).
#   SOURCE_DIR   Path to the agent source = Docker build context.
#   IMAGE_TAG    Image tag to build/push (e.g. writer-workflow-lg:v1).
#
# Optional environment variables (sensible defaults applied):
#   MODEL_DEPLOYMENT_NAME  Model deployment name (default: gpt-5.4).
#   TOOLBOX_NAME           Foundry toolbox name (default: linkedin-writer-tools).
#
# Arguments:
#   $1  ACR name
#   $2  Foundry project endpoint
# ---------------------------------------------------------------------------

ACR_NAME="$1"
FOUNDRY_PROJECT_ENDPOINT="$2"

if [ -z "$ACR_NAME" ] || [ -z "$FOUNDRY_PROJECT_ENDPOINT" ]; then
  echo "Usage: <wrapper>.sh <acr-name> <foundry-project-endpoint>" >&2
  exit 1
fi

: "${AGENT_NAME:?AGENT_NAME must be set by the calling wrapper}"
: "${SOURCE_DIR:?SOURCE_DIR must be set by the calling wrapper}"
: "${IMAGE_TAG:?IMAGE_TAG must be set by the calling wrapper}"

MODEL_DEPLOYMENT_NAME="${MODEL_DEPLOYMENT_NAME:-gpt-5.4}"
TOOLBOX_NAME="${TOOLBOX_NAME:-linkedin-writer-tools}"

IMAGE="${ACR_NAME}.azurecr.io/${IMAGE_TAG}"

# Foundry User built-in role. It grants the data-plane actions (including
# agents/write) the container needs to create agent versions at startup.
FOUNDRY_USER_ROLE_ID="53ca6127-db72-4b80-b1b0-d745d6d5456d"

# --- Build and push the container image to ACR ---
az acr login --name "$ACR_NAME"
az acr build --registry "$ACR_NAME" --image "$IMAGE_TAG" "$SOURCE_DIR"

echo "##### Successfully built and pushed the image to ACR: $IMAGE #####"

# --- Resolve the Foundry account ARM scope (role assignment target) ---
# The account name is embedded in the project endpoint; the account ARM id is
# derived from it. Telemetry is handled by the platform, so no App Insights
# connection string is passed here.
ACCOUNT_NAME=$(echo "$FOUNDRY_PROJECT_ENDPOINT" | sed -E 's#^https://([^.]+)\..*#\1#')
ACCOUNT_SCOPE=$(az cognitiveservices account list --query "[?name=='$ACCOUNT_NAME'].id | [0]" -o tsv)

# --- Create the agent (first deploy) or add a new version (subsequent deploys) ---
TOKEN=$(az account get-access-token --resource https://ai.azure.com --query accessToken -o tsv)
AUTH=(-H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json")

DEFINITION=$(cat <<EOF
{
  "kind": "hosted",
  "container_configuration": { "image": "$IMAGE" },
  "cpu": "1",
  "memory": "2Gi",
  "protocol_versions": [ {"protocol": "responses", "version": "2.0.0"} ],
  "environment_variables": {
    "MODEL_DEPLOYMENT_NAME": "$MODEL_DEPLOYMENT_NAME",
    "TOOLBOX_NAME": "$TOOLBOX_NAME"
  }
}
EOF
)

# There is no single create-or-update endpoint: POST /agents only creates
# (409 if it already exists), and updates are done by posting a new version.
# So: create the agent on first deploy, otherwise push a new version.
EXISTS=$(curl -s -o /dev/null -w "%{http_code}" "${AUTH[@]}" \
  "$FOUNDRY_PROJECT_ENDPOINT/agents/$AGENT_NAME?api-version=v1")

if [ "$EXISTS" = "200" ]; then
  # Update = new version
  AGENT_JSON=$(curl -s -X POST "$FOUNDRY_PROJECT_ENDPOINT/agents/$AGENT_NAME/versions?api-version=v1" \
    "${AUTH[@]}" -d "{\"definition\": $DEFINITION}")
else
  # First deployment = create the agent (with its 1st version)
  AGENT_JSON=$(curl -s -X POST "$FOUNDRY_PROJECT_ENDPOINT/agents?api-version=v1" \
    "${AUTH[@]}" -d "{\"name\": \"$AGENT_NAME\", \"definition\": $DEFINITION}")
fi

echo "##### Successfully created/updated the hosted agent #####"

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
