#!/usr/bin/env bash

# Agent-specific parameters for the LangGraph writer agent.
# All shared build/deploy logic lives in deploy_hosted_agent.sh.
# Usage: ./deploy_langgraph_agents.sh <acr-name> <foundry-project-endpoint>

HERE="$(cd "$(dirname "$0")" && pwd)"

export AGENT_NAME="writer-workflow-lg"
export SOURCE_DIR="$HERE/../langgraph-agents"
export AGENT_VERSION="v1"
export IMAGE_TAG="${AGENT_NAME}:${AGENT_VERSION}"

exec "$HERE/deploy_hosted_agent.sh" "$@"
