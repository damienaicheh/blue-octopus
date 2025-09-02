resource "azurerm_role_assignment" "container_app_acr_pull" {
  scope                = azurerm_container_registry.this.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.container_app_identity.principal_id
}

resource "azurerm_role_assignment" "api_center_apim_role_dev_env" {
  scope                = azapi_resource.apim_dev.id
  role_definition_name = "API Management Service Reader Role"
  principal_id         = azapi_resource.api_center.identity[0].principal_id
}

resource "azurerm_role_assignment" "api_center_apim_role_prod_env" {
  scope                = azapi_resource.apim_prod.id
  role_definition_name = "API Management Service Reader Role"
  principal_id         = azapi_resource.api_center.identity[0].principal_id
}