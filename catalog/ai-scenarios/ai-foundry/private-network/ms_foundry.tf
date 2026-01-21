resource "azapi_resource" "ms_foundry" {
  type                      = "Microsoft.CognitiveServices/accounts@2025-06-01"
  name                      = format("aif-%s", local.resource_suffix_kebabcase)
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
        (azurerm_user_assigned_identity.this.id) = {}
      }
    }

    properties = {
      # Support both Entra ID and API Key authentication for underlining Cognitive Services account
      disableLocalAuth = false

      # Specifies that this is an AI Foundry resource
      allowProjectManagement = true

      # Set custom subdomain name for DNS names created for this Foundry resource
      customSubDomainName = format("aif-%s", local.resource_suffix_kebabcase)

      # Network-related controls
      # Disable public access but allow Trusted Azure Services exception
      publicNetworkAccess = "Disabled"
      networkAcls = {
        defaultAction = "Allow"
      }

      # Enable VNet injection for Standard Agents
      networkInjections = [
        {
          scenario                   = "agent"
          subnetArmId                = azurerm_subnet.subnet_host_agent.id
          useMicrosoftManagedNetwork = false
        }
      ]
    }
  }

  depends_on = [
    azurerm_user_assigned_identity.this
  ]
}

resource "azurerm_cognitive_deployment" "aifoundry_deployment_model" {
  name                 = "gpt-4o"
  cognitive_account_id = azapi_resource.ms_foundry.id

  sku {
    name     = "GlobalStandard"
    capacity = 1
  }

  model {
    format  = "OpenAI"
    name    = "gpt-4o"
    version = "2024-11-20"
  }

  depends_on = [
    azapi_resource.ms_foundry
  ]
}
