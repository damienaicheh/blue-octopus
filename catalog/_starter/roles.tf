# =============================================================================
# User deployment role assignments end here
# =============================================================================

resource "azurerm_role_assignment" "storage_blob_data_contributor_to_user" {
  scope                = azurerm_storage_account.this.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "storage_blob_data_owner_to_user" {
  scope                = azurerm_storage_account.this.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}
