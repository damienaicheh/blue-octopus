resource "azapi_resource" "ms_foundry_project" {
  type                      = "Microsoft.CognitiveServices/accounts/projects@2025-06-01"
  name                      = format("prj-%s", local.resource_suffix_kebabcase)
  parent_id                 = azapi_resource.ms_foundry.id
  location                  = local.resource_group_location
  tags                      = local.tags_azapi
  schema_validation_enabled = false

  body = {
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
      displayName = "project"
      description = "A project for the AI Foundry account using User Assigned Identity"
    }
  }

  response_export_values = [
    "identity.principalId",
    "properties.internalId"
  ]

  depends_on = [
    azapi_resource.ms_foundry,
  ]
}
