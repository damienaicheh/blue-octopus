resource "azurerm_role_assignment" "api_center_apim_role_dev_env" {
  scope                = azurerm_api_management.apim_dev.id
  role_definition_name = "API Management Service Reader Role"
  principal_id         = azapi_resource.api_center.identity[0].principal_id
}

resource "azurerm_role_assignment" "api_center_apim_role_prod_env" {
  scope                = azurerm_api_management.apim_prod.id
  role_definition_name = "API Management Service Reader Role"
  principal_id         = azapi_resource.api_center.identity[0].principal_id
}

resource "azurerm_role_assignment" "user_api_center_data_reader" {
  scope                = azapi_resource.api_center.id
  role_definition_name = "Azure API Center Data Reader"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "user_key_vault_administrator" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "container_app_key_vault_secret_user_region_1" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_container_app.self_hosted_gateway_prod_region_1.identity[0].principal_id
}

resource "azurerm_role_assignment" "container_app_key_vault_secret_user_region_2" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_container_app.self_hosted_gateway_prod_region_2.identity[0].principal_id
}