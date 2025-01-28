resource "azurerm_cognitive_account" "open_ai_swc" {
  name                          = format("oai-%s", local.resource_suffix_kebabcase_swc)
  location                      = "swedencentral"
  resource_group_name           = local.resource_group_name
  kind                          = "OpenAI"
  sku_name                      = "S0"
  public_network_access_enabled = true
  custom_subdomain_name         = format("azure-open-ai-%s", local.resource_suffix_kebabcase_swc)
}

resource "azurerm_cognitive_deployment" "chat_model" {
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


resource "azurerm_cognitive_deployment" "image_generation_model" {
  name                 = "dall-e-3"
  cognitive_account_id = azurerm_cognitive_account.open_ai_swc.id
  model {
    format  = "OpenAI"
    name    = "dall-e-3"
    version = "3.0"
  }

  sku {
    name     = "Standard"
  }
}