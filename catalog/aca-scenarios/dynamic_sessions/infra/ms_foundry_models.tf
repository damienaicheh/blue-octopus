resource "azurerm_cognitive_deployment" "chat_completion_model" {
  name                 = "gpt-5.4"
  cognitive_account_id = azapi_resource.ms_foundry.id

  sku {
    name     = "GlobalStandard"
    capacity = 100
  }

  model {
    format  = "OpenAI"
    name    = "gpt-5.4"
    version = "2026-03-05"
  }
  version_upgrade_option = "OnceNewDefaultVersionAvailable"
  rai_policy_name        = "Microsoft.DefaultV2"


  depends_on = [
    azapi_resource.ms_foundry
  ]
}