#!/usr/bin/env bash

# Agent-specific parameters for the Microsoft Agent Framework writer agent.
# All shared build/deploy logic lives in deploy_hosted_agent.sh.
# Usage: ./deploy_microsoft_agent_framework.sh <acr-name> <foundry-project-endpoint>

HERE="$(cd "$(dirname "$0")" && pwd)"

export AGENT_NAME="writer-workflow-maf"
export SOURCE_DIR="$HERE/../microsoft-agent-framework"
export AGENT_VERSION="v1"
export IMAGE_TAG="${AGENT_NAME}:${AGENT_VERSION}"

exec "$HERE/deploy_hosted_agent.sh" "$@"
