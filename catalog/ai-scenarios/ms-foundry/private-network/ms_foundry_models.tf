resource "azurerm_cognitive_deployment" "msfoundry_mistral_deployment_model" {
  name                 = "mistral-document-ai-2505"
  cognitive_account_id = azapi_resource.ms_foundry.id

  sku {
    name     = "DataZoneStandard"
    capacity = 10
  }

  model {
    format  = "Mistral AI"
    name    = "mistral-document-ai-2505"
    version = "1"
  }
  version_upgrade_option = "OnceNewDefaultVersionAvailable"
  rai_policy_name        = "Microsoft.DefaultV2"


  depends_on = [
    azapi_resource.ms_foundry
  ]
}

resource "azurerm_cognitive_deployment" "text_embedding_model" {
  name                 = "text-embedding-3-large"
  cognitive_account_id = azapi_resource.ms_foundry.id

  sku {
    name     = "GlobalStandard"
    capacity = 100
  }

  model {
    format  = "OpenAI"
    name    = "text-embedding-3-large"
    version = "1"
  }
  version_upgrade_option = "OnceNewDefaultVersionAvailable"
  rai_policy_name        = "Microsoft.DefaultV2"


  depends_on = [
    azapi_resource.ms_foundry
  ]
}