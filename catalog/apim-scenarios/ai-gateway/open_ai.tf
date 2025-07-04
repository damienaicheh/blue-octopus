resource "azurerm_cognitive_account" "open_ai" {
  for_each                      = local.open_ai_resources
  name                          = each.value.name
  location                      = each.value.location
  resource_group_name           = local.resource_group_name
  kind                          = "OpenAI"
  sku_name                      = "S0"
  public_network_access_enabled = true
  custom_subdomain_name         = each.value.name
}

resource "azurerm_cognitive_deployment" "chat_model_deployment" {
  for_each             = local.open_ai_resources
  name                 = "gpt-4o"
  cognitive_account_id = azurerm_cognitive_account.open_ai[each.key].id
  model {
    format  = "OpenAI"
    name    = "gpt-4o"
    version = "2024-11-20"
  }

  sku {
    name     = "GlobalStandard"
    capacity = 5
  }
}