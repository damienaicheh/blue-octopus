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

resource "azurerm_role_assignment" "ai_gateway_monitoring_publisher" {
  name                             = local.monitoring_role_assignment_name
  scope                            = data.azapi_resource.monitoring_ingestion.output.dcr_id
  role_definition_id               = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/providers/Microsoft.Authorization/roleDefinitions/${local.monitoring_publisher_role_id}"
  principal_id                     = azapi_resource.ai_gateway.identity[0].principal_id
  principal_type                   = "ServicePrincipal"
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "ai_gateway_user_to_foundry_identity" {
  scope                            = azapi_resource.ai_gateway.id
  role_definition_name             = "AI Gateway User"
  principal_id                     = azurerm_user_assigned_identity.this.principal_id
}

# resource "azurerm_role_assignment" "ai_gateway_user_to_foundry_identity" {
#   name                             = uuidv5("url", "${azapi_resource.ai_gateway.id}|${azurerm_user_assigned_identity.this.principal_id}|caad7a21-134e-43f4-a550-c5ffc17e051c")
#   scope                            = azapi_resource.ai_gateway.id
#   role_definition_id               = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/providers/Microsoft.Authorization/roleDefinitions/caad7a21-134e-43f4-a550-c5ffc17e051c"
#   principal_id                     = azurerm_user_assigned_identity.this.principal_id
#   principal_type                   = "ServicePrincipal"
#   skip_service_principal_aad_check = true
# }
