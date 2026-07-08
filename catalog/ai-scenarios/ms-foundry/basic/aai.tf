resource "azurerm_application_insights" "this" {
  name                = format("appi-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  application_type    = "other"
  workspace_id        = azurerm_log_analytics_workspace.this.id
  tags                = local.tags
}

resource "azapi_resource" "conn_aai" {
  type                      = "Microsoft.CognitiveServices/accounts/projects/connections@2025-06-01"
  name                      = azurerm_application_insights.this.name
  parent_id                 = azapi_resource.ms_foundry_project.id
  schema_validation_enabled = false

  body = {
    properties = {
      category = "AppInsights"
      target   = azurerm_application_insights.this.id
      authType = "ApiKey"
      credentials = {
        key = azurerm_application_insights.this.instrumentation_key
      }
      metadata = {
        ApiType    = "Azure"
        ResourceId = azurerm_application_insights.this.id
        location   = var.location
      }
    }
  }

  depends_on = [
    azapi_resource.ms_foundry_project
  ]
}