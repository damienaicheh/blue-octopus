resource "azapi_resource" "ai_foundry_project" {
  type                      = "Microsoft.CognitiveServices/accounts/projects@2025-06-01"
  name                      = format("prj-%s", local.resource_suffix_kebabcase)
  parent_id                 = azapi_resource.ai_foundry.id
  location                  = local.resource_group_location
  schema_validation_enabled = false

  body = {
    sku = {
      name = "S0"
    }
    identity = {
      type = "SystemAssigned"
    }

    properties = {
      displayName = "project"
      description = "A project for the AI Foundry account with network secured deployed Agent"
    }
  }

  response_export_values = [
    "identity.principalId",
    "properties.internalId"
  ]

  depends_on = [
    azapi_resource.ai_foundry,
    azurerm_private_endpoint.sto_blob,
    azurerm_private_endpoint.cosmos_db,
    azurerm_private_endpoint.ai_search,
    azurerm_private_endpoint.ai_foundry
  ]
}

resource "azapi_resource" "ai_foundry_project_capability_host" {
  type                      = "Microsoft.CognitiveServices/accounts/projects/capabilityHosts@2025-04-01-preview"
  name                      = format("prj-cap-host-%s", local.resource_suffix_kebabcase)
  parent_id                 = azapi_resource.ai_foundry_project.id
  schema_validation_enabled = false

  body = {
    properties = {
      capabilityHostKind = "Agents"
      vectorStoreConnections = [
        azapi_resource.ai_search.name
      ]
      storageConnections = [
        azurerm_storage_account.this.name
      ]
      threadStorageConnections = [
        azurerm_cosmosdb_account.this.name
      ]
    }
  }
  depends_on = [
    azapi_resource.conn_ai_search,
    azapi_resource.conn_cosmos_db,
    azapi_resource.conn_storage,
  ]
}
