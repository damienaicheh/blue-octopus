resource "azapi_resource" "ms_foundry_project" {
  type                      = "Microsoft.CognitiveServices/accounts/projects@2026-07-01"
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
      description = "Basic Foundry project using Microsoft-managed agent storage and a user-assigned identity"
    }
  }

  response_export_values = [
    "identity.principalId",
    "properties.internalId"
  ]

  depends_on = [
    azapi_resource.ms_foundry,
    azurerm_cognitive_deployment.chat_completion_model,
  ]
}
