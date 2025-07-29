resource "azurerm_role_assignment" "func_host_blob_data_owner" {
  scope                = azurerm_storage_account.host.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = azurerm_user_assigned_identity.function_identity.principal_id
}

resource "azurerm_role_assignment" "func_host_blob_data_contributor" {
  scope                = azurerm_storage_account.host.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.function_identity.principal_id
}

resource "azurerm_role_assignment" "func_host_queue_data_contributor" {
  scope                = azurerm_storage_account.host.id
  role_definition_name = "Storage Queue Data Contributor"
  principal_id         = azurerm_user_assigned_identity.function_identity.principal_id
}

resource "azurerm_role_assignment" "func_host_table_data_contributor" {
  scope                = azurerm_storage_account.host.id
  role_definition_name = "Storage Table Data Contributor"
  principal_id         = azurerm_user_assigned_identity.function_identity.principal_id
}

resource "azurerm_role_assignment" "func_storage_queue_data_contributor" {
  scope                = azurerm_storage_account.storage.id
  role_definition_name = "Storage Queue Data Contributor"
  principal_id         = azurerm_user_assigned_identity.function_identity.principal_id
}

resource "azurerm_role_assignment" "func_reader" {
  scope                = azurerm_storage_account.storage.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.function_identity.principal_id
}

# For queue-triggered function app
resource "azurerm_role_assignment" "user_storage_queue_data_contributor" {
  scope                = azurerm_storage_account.storage.id
  role_definition_name = "Storage Queue Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "user_reader" {
  scope                = azurerm_storage_account.storage.id
  role_definition_name = "Reader"
  principal_id         = data.azurerm_client_config.current.object_id
}
