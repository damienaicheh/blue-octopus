resource "azapi_resource" "ms_foundry_all_models" {
  type                      = "Microsoft.CognitiveServices/accounts@2025-06-01"
  name                      = format("aif-com-%s", local.resource_suffix_kebabcase)
  parent_id                 = local.resource_group_id
  location                  = local.resource_group_location
  schema_validation_enabled = false

  body = {
    kind = "AIServices",
    sku = {
      name = "S0"
    }
    identity = {
      type = "UserAssigned"
      userAssignedIdentities = {
        (azurerm_user_assigned_identity.foundry_common_models.id) = {}
      }
    }

    properties = {
      # Support both Entra ID and API Key authentication for underlining Cognitive Services account
      disableLocalAuth = false

      # Specifies that this is an AI Foundry resource
      allowProjectManagement = true

      # Set custom subdomain name for DNS names created for this Foundry resource
      customSubDomainName = format("aif-com-%s", local.resource_suffix_kebabcase)

      # Network-related controls
      # Disable public access but allow Trusted Azure Services exception
      publicNetworkAccess = "Disabled"
      networkAcls = {
        defaultAction = "Allow"
      }
    }
  }

  depends_on = [
    azurerm_user_assigned_identity.foundry_common_models
  ]
}

resource "azurerm_cognitive_deployment" "msfoundry_chat_deployment_model" {
  name                 = "gpt-5.4-mini"
  cognitive_account_id = azapi_resource.ms_foundry_all_models.id

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
    azapi_resource.ms_foundry_all_models
  ]
}
