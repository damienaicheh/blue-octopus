resource "azapi_resource" "ms_foundry" {
  type                      = "Microsoft.CognitiveServices/accounts@2025-06-01"
  name                      = format("aif-%s", local.resource_suffix_kebabcase)
  parent_id                 = local.resource_group_id
  location                  = local.resource_group_location
  tags                      = local.tags_azapi
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
      publicNetworkAccess = "Enabled"
      networkAcls = {
        defaultAction = "Allow"
      }
    }
  }

  depends_on = [
    azurerm_user_assigned_identity.this
  ]
}

resource "azapi_resource" "ms_foundry_account_capability_host" {
  type                      = "Microsoft.CognitiveServices/accounts/capabilityHosts@2025-04-01-preview"
  name                      = format("acc-cap-host-%s", local.resource_suffix_kebabcase)
  parent_id                 = azapi_resource.ms_foundry.id
  schema_validation_enabled = false

  body = {
    properties = {
      capabilityHostKind = "Agents"
    }
  }

  depends_on = [
    azapi_resource.ms_foundry
  ]
}