resource "azapi_resource" "ai_gateway" {
  type      = "Microsoft.ApiManagement/aigateways@2025-09-01-preview"
  name      = format("ai-gw-%s", local.resource_suffix_kebabcase)
  parent_id = local.resource_group_id
  identity {
    type = "SystemAssigned"
  }
  location = local.resource_group_location
  tags     = local.tags_azapi
  body = {
    properties = {}
  }
  schema_validation_enabled = false
}

resource "azapi_resource" "ai_gateway_foundry_user" {
  type      = "Microsoft.Authorization/roleAssignments@2022-04-01"
  name      = uuidv5("url", "${azapi_resource.ms_foundry.id}/${azapi_resource.ai_gateway.id}/53ca6127-db72-4b80-b1b0-d745d6d5456d")
  parent_id = azapi_resource.ms_foundry.id

  body = {
    properties = {
      principalId      = azapi_resource.ai_gateway.identity[0].principal_id
      principalType    = "ServicePrincipal"
      roleDefinitionId = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/providers/Microsoft.Authorization/roleDefinitions/53ca6127-db72-4b80-b1b0-d745d6d5456d"
    }
  }
}

resource "azapi_resource" "ai_gateway_foundry_provider" {
  type                      = "Microsoft.ApiManagement/aigateways/workspaces/modelProviders@2025-09-01-preview"
  name                      = azapi_resource.ms_foundry.name
  parent_id                 = "${azapi_resource.ai_gateway.id}/workspaces/default"
  schema_validation_enabled = false

  body = {
    properties = {
      kind        = "Foundry"
      displayName = azapi_resource.ms_foundry.name
      foundry = {
        endpoint    = "${trimsuffix(azapi_resource.ms_foundry.output.properties.endpoint, "/")}/"
        resourceIds = [azapi_resource.ms_foundry.id]
        authentication = {
          kind = "ManagedIdentity"
          managedIdentity = {
            resource = "https://cognitiveservices.azure.com/"
          }
        }
      }
    }
  }

  depends_on = [
    azapi_resource.ai_gateway_foundry_user
  ]
}

resource "azapi_resource" "ai_gateway_telemetry_exporter" {
  type                      = "Microsoft.ApiManagement/aigateways/workspaces/telemetryExporters@2025-09-01-preview"
  name                      = "applicationInsights"
  parent_id                 = "${azapi_resource.ai_gateway.id}/workspaces/default"
  schema_validation_enabled = false

  # The preview API may omit tracesEndpoint and credentials from GET responses.
  ignore_missing_property = true

  body = {
    properties = {
      kind           = "OpenTelemetry"
      payloadCapture = false
      applicationInsights = {
        resourceId = azapi_resource.application_insights.id
      }
      openTelemetry = {
        metricsEndpoint = data.azapi_resource.monitoring_ingestion.output.metrics_endpoint
        logsEndpoint    = data.azapi_resource.monitoring_ingestion.output.logs_endpoint
        tracesEndpoint  = data.azapi_resource.monitoring_ingestion.output.traces_endpoint
        credentials = {
          managedIdentity = {
            resource = "https://monitor.azure.com"
          }
        }
      }
    }
  }

  depends_on = [azurerm_role_assignment.ai_gateway_monitoring_publisher]
}