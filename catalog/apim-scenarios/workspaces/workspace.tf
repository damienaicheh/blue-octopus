resource "azapi_resource" "workspace_1" {
  type      = "Microsoft.ApiManagement/service/workspaces@2023-09-01-preview"
  name      = var.workspace_1.name
  parent_id = azurerm_api_management.this.id
  body = jsonencode({
    properties = {
      description = var.workspace_1.description
      displayName = var.workspace_1.display_name
    }
  })
  depends_on = [
    azurerm_api_management.this
  ]
}

resource "azapi_resource" "workspace_2" {
  type      = "Microsoft.ApiManagement/service/workspaces@2023-09-01-preview"
  name      = var.workspace_2.name
  parent_id = azurerm_api_management.this.id
  body = jsonencode({
    properties = {
      description = var.workspace_2.description
      displayName = var.workspace_2.display_name
    }
  })
  depends_on = [
    azurerm_api_management.this
  ]
}

resource "azapi_resource" "workspace_3" {
  type      = "Microsoft.ApiManagement/service/workspaces@2023-09-01-preview"
  name      = var.workspace_3.name
  parent_id = azurerm_api_management.this.id
  body = jsonencode({
    properties = {
      description = var.workspace_3.description
      displayName = var.workspace_3.display_name
    }
  })
  depends_on = [
    azurerm_api_management.this
  ]
}

resource "azapi_resource" "workspace_1_application_insights" {
  type      = "Microsoft.ApiManagement/service/workspaces/loggers@2023-09-01-preview"
  name      = format("apim-%s-applicationinsights", var.workspace_1.name)
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