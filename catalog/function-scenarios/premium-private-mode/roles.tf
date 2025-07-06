resource "azurerm_role_assignment" "func_storage_blob_data_owner" {
  scope                = azurerm_storage_account.this.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = azurerm_linux_function_app.this.identity[0].principal_id
}

# For blob-triggered function app
resource "azurerm_role_assignment" "func_storage_account_contributor" {
  scope                = azurerm_storage_account.this.id
  role_definition_name = "Storage Account Contributor"
  principal_id         = azurerm_linux_function_app.this.identity[0].principal_id
}

# For blob-triggered function app
resource "azurerm_role_assignment" "func_storage_queue_data_owner" {
  scope                = azurerm_storage_account.this.id
  role_definition_name = "Storage Queue Data Contributor"
  principal_id         = azurerm_linux_function_app.this.identity[0].principal_id
}
