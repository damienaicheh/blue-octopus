# =============================================================================
# Role assignments for User Assigned Identity (UAI)
# These must be assigned BEFORE the capability host is created
# =============================================================================

resource "azurerm_role_assignment" "cosmosdb_operator_uai" {
  scope                = azurerm_cosmosdb_account.this.id
  role_definition_name = "Cosmos DB Operator"
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}

resource "azurerm_role_assignment" "storage_blob_data_contributor_uai" {
  scope                = azurerm_storage_account.this.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}

resource "azurerm_role_assignment" "search_index_data_contributor_uai" {
  scope                = azapi_resource.ai_search.id
  role_definition_name = "Search Index Data Contributor"
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}

resource "azurerm_role_assignment" "search_service_contributor_uai" {
  scope                = azapi_resource.ai_search.id
  role_definition_name = "Search Service Contributor"
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}

# =============================================================================
# Role assignments for Cosmos DB SQL data plane
# These must be assigned AFTER the capability host is created
# =============================================================================

resource "azurerm_cosmosdb_sql_role_assignment" "cosmosdb_db_sql_role_uai_user_thread_message_store" {
  resource_group_name = local.resource_group_name
  account_name        = azurerm_cosmosdb_account.this.name
  scope               = "${azurerm_cosmosdb_account.this.id}/dbs/enterprise_memory/colls/${local.project_id_guid}-thread-message-store"
  role_definition_id  = "${azurerm_cosmosdb_account.this.id}/sqlRoleDefinitions/00000000-0000-0000-0000-000000000002"
  principal_id        = azurerm_user_assigned_identity.this.principal_id

  depends_on = [
    azapi_resource.ms_foundry_project_capability_host
  ]
}

resource "azurerm_cosmosdb_sql_role_assignment" "cosmosdb_db_sql_role_uai_system_thread_name" {
  resource_group_name = local.resource_group_name
  account_name        = azurerm_cosmosdb_account.this.name
  scope               = "${azurerm_cosmosdb_account.this.id}/dbs/enterprise_memory/colls/${local.project_id_guid}-system-thread-message-store"
  role_definition_id  = "${azurerm_cosmosdb_account.this.id}/sqlRoleDefinitions/00000000-0000-0000-0000-000000000002"
  principal_id        = azurerm_user_assigned_identity.this.principal_id
  depends_on = [
    azurerm_cosmosdb_sql_role_assignment.cosmosdb_db_sql_role_uai_user_thread_message_store
  ]
}

resource "azurerm_cosmosdb_sql_role_assignment" "cosmosdb_db_sql_role_uai_entity_store_name" {
  name                = uuidv5("dns", "${azapi_resource.ms_foundry_project.name}${azurerm_user_assigned_identity.this.principal_id}entitystore_dbsqlrole")
  resource_group_name = local.resource_group_name
  account_name        = azurerm_cosmosdb_account.this.name
  scope               = "${azurerm_cosmosdb_account.this.id}/dbs/enterprise_memory/colls/${local.project_id_guid}-agent-entity-store"
  role_definition_id  = "${azurerm_cosmosdb_account.this.id}/sqlRoleDefinitions/00000000-0000-0000-0000-000000000002"
  principal_id        = azurerm_user_assigned_identity.this.principal_id

  depends_on = [
    azurerm_cosmosdb_sql_role_assignment.cosmosdb_db_sql_role_uai_system_thread_name
  ]
}

# =============================================================================
# Role assignment for Storage Blob Data Owner with condition
# This must be assigned AFTER the capability host is created
# =============================================================================

resource "azurerm_role_assignment" "storage_blob_data_owner_uai" {
  scope                = azurerm_storage_account.this.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = azurerm_user_assigned_identity.this.principal_id
  condition_version    = "2.0"
  condition            = <<-EOT
  (
    (
      !(ActionMatches{'Microsoft.Storage/storageAccounts/blobServices/containers/blobs/tags/read'})
      AND !(ActionMatches{'Microsoft.Storage/storageAccounts/blobServices/containers/blobs/filter/action'})
      AND !(ActionMatches{'Microsoft.Storage/storageAccounts/blobServices/containers/blobs/tags/write'})
    )
    OR
    (@Resource[Microsoft.Storage/storageAccounts/blobServices/containers:name] StringStartsWithIgnoreCase '${local.project_id_guid}'
    AND @Resource[Microsoft.Storage/storageAccounts/blobServices/containers:name] StringLikeIgnoreCase '*-azureml-agent')
  )
  EOT

  depends_on = [
    azapi_resource.ms_foundry_project_capability_host
  ]
}

# =============================================================================
# User deployment role assignments end here
# =============================================================================

resource "azurerm_role_assignment" "ms_foundry_azure_ai_user_to_user" {
  scope                = azapi_resource.ms_foundry.id
  role_definition_name = "Azure AI User"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "ms_foundry_azure_ai_project_manager_to_user" {
  scope                = azapi_resource.ms_foundry.id
  role_definition_name = "Azure AI Project Manager"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "ms_foundry_project_azure_ai_user_to_user" {
  scope                = azapi_resource.ms_foundry_project.id
  role_definition_name = "Azure AI User"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "ms_foundry_project_azure_ai_project_manager_to_user" {
  scope                = azapi_resource.ms_foundry_project.id
  role_definition_name = "Azure AI Project Manager"
  principal_id         = data.azurerm_client_config.current.object_id
}