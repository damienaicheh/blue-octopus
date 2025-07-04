resource "azurerm_cognitive_account" "open_ai" {
  name                          = format("oai-%s", local.resource_suffix_kebabcase)
  location                      = local.resource_group_location
  resource_group_name           = local.resource_group_name
  kind                          = "OpenAI"
  sku_name                      = "S0"
  public_network_access_enabled = true
  custom_subdomain_name         = format("oai-%s", local.resource_suffix_kebabcase)
  tags                          = local.tags
}

resource "azurerm_cognitive_deployment" "realtime_model" {
  name                 = "gpt-4o-realtime-preview"
  cognitive_account_id = azurerm_cognitive_account.open_ai.id
  model {
    format  = "OpenAI"
    name    = "gpt-4o-realtime-preview"
    version = "2024-12-17"
  }

  sku {
    name     = "GlobalStandard"
    capacity = 1
  }
}

resource "azurerm_cognitive_deployment" "chat_completion_model" {
  name                 = "gpt-4.1"
  cognitive_account_id = azurerm_cognitive_account.open_ai.id
  model {
    format  = "OpenAI"
    name    = "gpt-4.1"
    version = "2025-04-14"
  }

  sku {
    name     = "GlobalStandard"
    capacity = 100
  }
}

resource "azapi_resource" "open_ai_connection" {
  type      = "Microsoft.CognitiveServices/accounts/connections@2025-04-01-preview"
  name      = format("con-%s", azurerm_cognitive_account.open_ai.name)
  parent_id = azapi_resource.ai_services.id

  body = {
    properties = {
      category = "AzureOpenAI",
      target   = azurerm_cognitive_account.open_ai.endpoint,
      authType = "ApiKey",
      credentials = {
        key = azurerm_cognitive_account.open_ai.primary_access_key
      }
      isSharedToAll = true,
      metadata = {
        ApiType    = "Azure",
        ResourceId = azurerm_cognitive_account.open_ai.id
      }
    }
  }
  response_export_values = ["*"]
}
