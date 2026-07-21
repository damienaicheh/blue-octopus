# =============================================================================
# Foundry role assignments for the deploying user
# =============================================================================

resource "azurerm_role_assignment" "ms_foundry_foundry_user_to_user" {
  scope                = azapi_resource.ms_foundry.id
  role_definition_name = "Foundry User"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "ms_foundry_foundry_project_manager_to_user" {
  scope                = azapi_resource.ms_foundry.id
  role_definition_name = "Foundry Project Manager"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "ms_foundry_project_foundry_user_to_user" {
  scope                = azapi_resource.ms_foundry_project.id
  role_definition_name = "Foundry User"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "ms_foundry_project_foundry_project_manager_to_user" {
  scope                = azapi_resource.ms_foundry_project.id
  role_definition_name = "Foundry Project Manager"
  principal_id         = data.azurerm_client_config.current.object_id
}

# =============================================================================
# Container App Session Pool role assignments for the deploying user
# =============================================================================

resource "azurerm_role_assignment" "aca_session_executor_to_user" {
  scope                = azapi_resource.dynamic_session_pool.id
  role_definition_name = "Azure ContainerApps Session Executor"
  principal_id         = data.azurerm_client_config.current.object_id
}