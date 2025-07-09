resource "azurerm_role_assignment" "container_app_acr_pull" {
  scope                = azurerm_container_registry.this.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.container_app_identity.principal_id
}