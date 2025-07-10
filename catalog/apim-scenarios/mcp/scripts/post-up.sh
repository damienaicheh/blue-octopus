#!/bin/bash

echo "Running post-up script for MCP scenario..."

# load terraform outputs

RESOURCE_GROUP_NAME=$(terraform -chdir=../infra output -raw resource_group_name)
CONTAINER_REGISTRY_NAME=$(terraform -chdir=../infra output -raw container_registry_name)
WEATHER_CONTAINERAPP_RESOURCE_NAME=$(terraform -chdir=../infra output -raw container_app_weather_mcp_name)
echo "Resource Group: $RESOURCE_GROUP_NAME, Registry: $CONTAINER_REGISTRY_NAME, App: $WEATHER_CONTAINERAPP_RESOURCE_NAME"
WEATHER_MCP_SERVER_IMAGE="weather-mcp-server"
WEATHER_MCP_SERVER_SRC="../src/weather-mcp-server"
BUILD=8

az acr build --image $WEATHER_MCP_SERVER_IMAGE:v0.$BUILD --resource-group $RESOURCE_GROUP_NAME --registry $CONTAINER_REGISTRY_NAME --file $WEATHER_MCP_SERVER_SRC/Dockerfile $WEATHER_MCP_SERVER_SRC/. --no-logs

az containerapp update -n $WEATHER_CONTAINERAPP_RESOURCE_NAME -g $RESOURCE_GROUP_NAME --image "$CONTAINER_REGISTRY_NAME.azurecr.io/$WEATHER_MCP_SERVER_IMAGE:v0.$BUILD"