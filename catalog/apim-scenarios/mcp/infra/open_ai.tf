resource "azurerm_cognitive_account" "open_ai" {
  for_each                      = local.open_ai_resources
  name                          = each.value.name
  location                      = each.value.location
  resource_group_name           = local.resource_group_name
  kind                          = "OpenAI"
  sku_name                      = "S0"
  public_network_access_enabled = true
  custom_subdomain_name         = each.value.name
  tags                          = local.tags
}

# resource "azurerm_cognitive_deployment" "realtime_chat_model_deployment" {
#   for_each             = local.open_ai_resources
#   name                 = "gpt-4o-realtime-preview"
#   cognitive_account_id = azurerm_cognitive_account.open_ai[each.key].id
#   model {
#     format  = "OpenAI"
#     name    = "gpt-4o-realtime-preview"
#     version = "2025-06-03"
#   }

#   sku {
#     name     = "GlobalStandard"
#     capacity = 2
#   }
# }