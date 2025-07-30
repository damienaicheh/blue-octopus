resource "azurerm_api_management_subscription" "openai_subscription_1" {
  api_management_name = azapi_resource.apim.name
  resource_group_name = local.resource_group_name
  api_id              = azurerm_api_management_api.openai_api.id
  display_name        = "OpenAI API - Subscription 1"
  state               = "active"
  allow_tracing       = true
}

resource "azurerm_api_management_subscription" "openai_subscription_2" {
  api_management_name = azapi_resource.apim.name
  resource_group_name = local.resource_group_name
  api_id              = azurerm_api_management_api.openai_api.id
  display_name        = "OpenAI API - Subscription 2"
  state               = "active"
  allow_tracing       = true
}

resource "azurerm_api_management_subscription" "openai_subscription_3" {
  api_management_name = azapi_resource.apim.name
  resource_group_name = local.resource_group_name
  api_id              = azurerm_api_management_api.openai_api.id
  display_name        = "OpenAI API - Subscription 3"
  state               = "active"
  allow_tracing       = true
}