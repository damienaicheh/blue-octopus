resource "azurerm_storage_account" "this" {
  name                     = format("st%s", local.resource_suffix_lowercase)
  resource_group_name      = local.resource_group_name
  location                 = local.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  ## Identity configuration
  shared_access_key_enabled = false

  ## Network access configuration
  min_tls_version = "TLS1_2"

  allow_nested_items_to_be_public = false

  tags = local.tags

  network_rules {
    default_action = "Deny"
    bypass = [
      "AzureServices"
    ]
  }
}

resource "azapi_resource" "conn_storage" {
  type                      = "Microsoft.CognitiveServices/accounts/projects/connections@2025-06-01"
  name                      = azurerm_storage_account.this.name
  parent_id                 = azapi_resource.ms_foundry_project.id
  schema_validation_enabled = false

  depends_on = [
    azapi_resource.ms_foundry_project
  ]

  body = {
    name = azurerm_storage_account.this.name
    properties = {
      category = "AzureStorageAccount"
      target   = azurerm_storage_account.this.primary_blob_endpoint
      authType = "AAD"
      metadata = {
        ApiType    = "Azure"
        ResourceId = azurerm_storage_account.this.id
        location   = local.resource_group_location
      }
    }
  }

  response_export_values = [
    "identity.principalId"
  ]
}
