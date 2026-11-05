resource "azurerm_cognitive_deployment" "chat_completion_model" {
  name                 = "gpt-6.1-sol"
  cognitive_account_id = azapi_resource.ms_foundry.id

  sku {
    name     = "GlobalStandard"
    capacity = 100
  }

  model {
    format  = "OpenAI"
    name    = "gpt-6.1-sol"
    version = "2026-09-29"
  }
  version_upgrade_option = "OnceNewDefaultVersionAvailable"
  rai_policy_name        = "Microsoft.DefaultV2"
}

resource "azurerm_cognitive_deployment" "chat_completion_model_mini" {
  name                 = "gpt-5-mini"
  cognitive_account_id = azapi_resource.ms_foundry.id

  sku {
    name     = "GlobalStandard"
    capacity = 100
  }

  model {
    format  = "OpenAI"
    name    = "gpt-5-mini"
    version = "2025-08-07"
  }
  version_upgrade_option = "OnceNewDefaultVersionAvailable"
  rai_policy_name        = "Microsoft.DefaultV2"
}