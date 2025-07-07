resource "azurerm_key_vault" "this" {
  name                        = format("kv-%s", local.resource_suffix_kebabcase)
  location                    = local.resource_group_location
  resource_group_name         = local.resource_group_name
  enabled_for_disk_encryption = false
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enable_rbac_authorization   = true

  sku_name = "standard"
  tags     = local.tags
}

resource "azurerm_key_vault_secret" "website_content_azure_file_connection_string" {
  name         = "WebsiteContentAzureFileConnectionString"
  value        = "DefaultEndpointsProtocol=https;AccountName=${azurerm_storage_account.this.name};AccountKey=${azurerm_storage_account.this.primary_access_key};EndpointSuffix=core.windows.net"
  key_vault_id = azurerm_key_vault.this.id

  lifecycle {
    ignore_changes = [
      value
    ]
  }

  depends_on = [
    azurerm_role_assignment.user_key_vault_administrator
  ]
}
