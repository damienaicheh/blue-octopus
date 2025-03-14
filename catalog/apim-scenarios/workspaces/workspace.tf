resource "azapi_resource" "workspace_1" {
  type      = "Microsoft.ApiManagement/service/workspaces@2023-09-01-preview"
  name      = var.workspace.name
  parent_id = azurerm_api_management.this.id
  body = jsonencode({
    properties = {
      description = var.workspace.description
      displayName = var.workspace.display_name
    }
  })
  depends_on = [
    azurerm_api_management.this
  ]
}

resource "azapi_resource" "gateway_workspace_1" {
  type      = "Microsoft.ApiManagement/gateways@2023-09-01-preview"
  name      = format("apim-gw-wkp-1-%s", local.resource_suffix_kebabcase)
  location  = azurerm_api_management.this.location
  parent_id = local.resource_group_id
  tags      = local.tags_azapi
  body = jsonencode({
    properties = {
      backend = {
        subnet = {
          id = azurerm_subnet.subnet_workspace_1_spk1.id
        }
      }
      configurationApi   = {}
      frontend           = {}
      virtualNetworkType = "Internal"
    }
    sku = {
      capacity = 1
      name     = "WorkspaceGatewayPremium"
    }
  })

  depends_on = [
    azurerm_api_management.this
  ]

  timeouts {
    create = "10h"
    update = "10h"
  }
}

resource "azapi_resource" "workspace_1_gateway_connection" {
  type      = "Microsoft.ApiManagement/gateways/configConnections@2023-09-01-preview"
  name      = "apim-gw-wkp-1-con"
  parent_id = azapi_resource.gateway_workspace_1.id
  body = jsonencode({
    properties = {
      sourceId = azapi_resource.workspace_1.id
    }
  })
  depends_on = [
    azapi_resource.workspace_1,
    azapi_resource.gateway_workspace_1
  ]

  timeouts {
    create = "5h"
    update = "5h"
  }
}

resource "azapi_resource" "workspace_1_application_insights" {
  type = "Microsoft.ApiManagement/service/workspaces/loggers@2023-09-01-preview"
  name = format("apim-%s-applicationinsights", var.workspace.name)
  parent_id = azapi_resource.workspace_1.id
  body = jsonencode({
    properties = {
      credentials = {
        instrumentationKey = azurerm_application_insights.workspace_1.instrumentation_key
      }
      loggerType = "applicationInsights"
      resourceId = azurerm_application_insights.workspace_1.id
    }
  })
}