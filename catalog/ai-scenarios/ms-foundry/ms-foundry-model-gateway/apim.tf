resource "azurerm_api_management" "this" {
  name                 = format("apim-%s", local.resource_suffix_kebabcase)
  location             = local.resource_group_location
  resource_group_name  = local.resource_group_name
  publisher_name       = "Me"
  publisher_email      = "me@example.com"
  virtual_network_type = "External"

  sku_name                      = "StandardV2_1"
  public_network_access_enabled = true
  tags                          = local.tags

  identity {
    type = "SystemAssigned"
  }

  virtual_network_configuration {
    subnet_id = azurerm_subnet.subnet_apim.id
  }

  lifecycle {
    ignore_changes = [
      public_network_access_enabled,
    ]
  }

  depends_on = [
    azurerm_private_dns_zone.privatelink_azure_api_net,
    # azurerm_role_assignment.apim_subnet_network_contributor_current,
  ]
}

resource "azapi_update_resource" "apim_disable_network_access" {
  type        = "Microsoft.ApiManagement/service@2024-05-01"
  resource_id = azurerm_api_management.this.id

  body = {
    properties = {
      publicNetworkAccess = "Disabled"
    }
  }

  depends_on = [
    azurerm_private_endpoint.apim_gateway,
  ]
}

resource "azurerm_api_management_logger" "this" {
  name                = format("apim-logger-%s", local.resource_suffix_kebabcase)
  api_management_name = azurerm_api_management.this.name
  resource_group_name = local.resource_group_name
  resource_id         = azapi_resource.application_insights.id
  buffered            = false

  application_insights {
    instrumentation_key = azapi_resource.application_insights.output.properties.InstrumentationKey
  }

  depends_on = [
    azapi_resource.application_insights,
    azurerm_api_management.this
  ]
}

resource "azurerm_monitor_diagnostic_setting" "apim" {
  name                           = "apim-diagnostic-settings"
  target_resource_id             = azurerm_api_management.this.id
  log_analytics_destination_type = "Dedicated"
  log_analytics_workspace_id     = azapi_resource.log_analytics_workspace.id

  enabled_metric {
    category = "AllMetrics"
  }

  # enabled_log {
  #   category = "GatewayLogs" // All other possibilities: DeveloperPortalAuditLogs //WebSocketConnectionLogs
  # }

  # enabled_log {
  #   category = "DeveloperPortalAuditLogs"
  # }

  // Or use this:
  enabled_log {
    category_group = "allLogs" // All other possibilities: audit
  }

  # enabled_log {
  #   category_group = "audit"
  # }
}


resource "azapi_resource" "conn_ai_gateway" {
  type                      = "Microsoft.CognitiveServices/accounts/projects/connections@2025-06-01"
  name                      = "ai-gateway"
  parent_id                 = azapi_resource.ms_foundry_project.id
  schema_validation_enabled = false

  body = {
    name = "ai-gateway"
    properties = {
      authType      = "ApiKey"
      category      = "ApiManagement"
      isSharedToAll = false
      target        = format("%s/%s", trimsuffix(azurerm_api_management.this.gateway_url, "/"), azurerm_api_management_api.ms_foundry_azure_ai.path)
      credentials = {
        key = azurerm_api_management_subscription.ms_foundry_azure_ai.primary_key
      }
      metadata = {
        ApiType             = "Azure"
        inferenceAPIVersion = "2024-12-01-preview"
        Location            = local.resource_group_location
        deploymentInPath    = "true"
        models = jsonencode([
          {
            name = azurerm_cognitive_deployment.msfoundry_chat_deployment_model.name
            properties = {
              model = {
                name    = "gpt-5.4-mini"
                version = "2026-03-17"
                format  = "OpenAI"
              }
            }
          }
        ])
      }
    }
  }

  depends_on = [
    azapi_resource.ms_foundry_project,
    azurerm_api_management_subscription.ms_foundry_azure_ai,
    azurerm_cognitive_deployment.msfoundry_chat_deployment_model,
  ]
}