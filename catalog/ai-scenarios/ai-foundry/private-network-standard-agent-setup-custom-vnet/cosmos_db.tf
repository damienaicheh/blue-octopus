resource "azurerm_cosmosdb_account" "this" {
  name                = format("cosmos-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  tags                = local.tags

  # Set security-related settings
  local_authentication_disabled = true
  public_network_access_enabled = false

  # Set high availability and failover settings
  automatic_failover_enabled       = false
  multiple_write_locations_enabled = false


  capabilities {
    name = "EnableServerless"
  }

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = local.resource_group_location
    failover_priority = 0
  }
}

resource "azapi_resource" "conn_cosmos_db" {
  type                      = "Microsoft.CognitiveServices/accounts/projects/connections@2025-06-01"
  name                      = azurerm_cosmosdb_account.this.name
  parent_id                 = azapi_resource.ai_foundry_project.id
  schema_validation_enabled = false

  body = {
    name = azurerm_cosmosdb_account.this.name
    properties = {
      category = "CosmosDb"
      target   = azurerm_cosmosdb_account.this.endpoint
      authType = "AAD"
      metadata = {
        ApiType    = "Azure"
        ResourceId = azurerm_cosmosdb_account.this.id
        location   = local.resource_group_location
      }
    }
  }

  depends_on = [
    azapi_resource.ai_foundry_project
  ]
}
