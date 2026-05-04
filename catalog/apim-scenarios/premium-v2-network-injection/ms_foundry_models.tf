resource "azurerm_cognitive_deployment" "msfoundry_chat_deployment_model" {
  name                 = "gpt-5.4-mini"
  cognitive_account_id = azapi_resource.ms_foundry.id

  sku {
    name     = "GlobalStandard"
    capacity = 20
  }

  model {
    format  = "OpenAI"
    name    = "gpt-5.4-mini"
    version = "2026-03-17"
  }
  version_upgrade_option = "OnceNewDefaultVersionAvailable"
  rai_policy_name        = "Microsoft.DefaultV2"


  depends_on = [
    azapi_resource.ms_foundry
  ]
}
