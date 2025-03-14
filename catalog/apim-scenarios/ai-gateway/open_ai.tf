resource "azurerm_cognitive_account" "open_ai" {
  for_each                      = { for instance in local.open_ai_resources : instance.name => instance }
  name                          = each.key
  location                      = local.resource_group_location
  resource_group_name           = local.resource_group_name
  kind                          = "OpenAI"
  sku_name                      = "S0"
  public_network_access_enabled = true
  custom_subdomain_name         = each.key
}

resource "azurerm_cognitive_deployment" "chat_model_deployment" {
  for_each             = { for instance in local.open_ai_resources : instance.name => instance }
  name                 = "gpt-4o"
  cognitive_account_id = azurerm_cognitive_account.open_ai[each.key].id
  model {
    format  = "OpenAI"
    name    = "gpt-4o"
    version = "2024-11-20"
  }

  sku {
    name     = "GlobalStandard"
    capacity = 20
  }
}