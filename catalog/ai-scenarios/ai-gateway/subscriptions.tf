resource "azurerm_api_management_subscription" "openai_subscription" {
  api_management_name = azapi_resource.apim.name
  resource_group_name = local.resource_group_name
  api_id              = azapi_resource.openai_api.id
  display_name        = "OpenAI API"
  state               = "active"
  allow_tracing       = true
}
