resource "azurerm_cognitive_account" "open_ai" {
  name                          = format("oai-%s", local.resource_suffix_kebabcase)
  location                      = local.resource_group_location
  resource_group_name           = local.resource_group_name
  kind                          = "OpenAI"
  sku_name                      = "S0"
  public_network_access_enabled = true
  custom_subdomain_name         = format("oai-%s", local.resource_suffix_kebabcase)
}

resource "azurerm_cognitive_deployment" "chat_model" {
  name                 = "gpt-4o"
  cognitive_account_id = azurerm_cognitive_account.open_ai.id
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

resource "azurerm_cognitive_account" "open_ai_swc" {
  name                          = format("oai-%s", local.resource_suffix_kebabcase_swc)
  location                      = var.location_swc
  resource_group_name           = local.resource_group_name
  kind                          = "OpenAI"
  sku_name                      = "S0"
  public_network_access_enabled = true
  custom_subdomain_name         = format("oai-%s", local.resource_suffix_kebabcase_swc)
}

resource "azurerm_cognitive_deployment" "chat_model_swc" {
  name                 = "gpt-4o"
  cognitive_account_id = azurerm_cognitive_account.open_ai_swc.id
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
