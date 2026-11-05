# =============================================================================
# User deployment role assignments end here
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
# Foundry role assignments end here
# =============================================================================

# Needed for Foundry Memory
resource "azurerm_role_assignment" "foundry_user_to_user_assigned_identity_of_foundry" {
  scope                = azapi_resource.ms_foundry_project.id
  role_definition_name = "Foundry User"
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}

# Needed for Application Insights
resource "azurerm_role_assignment" "monitoring_metrics_publisher_to_user_assigned_identity_of_foundry" {
  scope                = azapi_resource.application_insights.id
  role_definition_name = "Monitoring Metrics Publisher"
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}