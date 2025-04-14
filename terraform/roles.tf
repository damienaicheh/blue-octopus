# Mandatory roles: https://learn.microsoft.com/en-us/azure/deployment-environments/quickstart-create-and-configure-devcenter#assign-roles-for-the-dev-center-managed-identity
resource "azurerm_role_assignment" "dev_center_subscription_contributor" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azapi_resource.dev_center.output.identity.principalId
  depends_on = [
    azapi_resource.dev_center
  ]
}

resource "azurerm_role_assignment" "dev_center_subscription_user_access_administrator" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "User Access Administrator"
  principal_id         = azapi_resource.dev_center.output.identity.principalId
  depends_on = [
    azapi_resource.dev_center
  ]
}

resource "azurerm_role_assignment" "dev_center_key_vault_secret_user" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azapi_resource.dev_center.output.identity.principalId
  depends_on = [
    azapi_resource.dev_center
  ]
}

resource "azurerm_role_assignment" "dev_center_dev_box_user" {
  for_each             = var.projects
  scope                = azapi_resource.projects[each.key].id
  role_definition_name = "DevCenter Dev Box User"
  principal_id         = data.azurerm_client_config.current.object_id
  depends_on = [
    azapi_resource.projects
  ]
}

resource "azurerm_role_assignment" "deployment_environments_reader" {
  for_each             = var.projects
  scope                = azapi_resource.projects[each.key].id
  role_definition_name = "Deployment Environments Reader"
  principal_id         = data.azurerm_client_config.current.object_id
  depends_on = [
    azapi_resource.projects
  ]
}

resource "azurerm_role_assignment" "deployment_environments_user" {
  for_each             = var.projects
  scope                = azapi_resource.projects[each.key].id
  role_definition_name = "Deployment Environments User"
  principal_id         = data.azurerm_client_config.current.object_id
  depends_on = [
    azapi_resource.projects
  ]
}

resource "azurerm_role_assignment" "dev_center_project_admin" {
  for_each             = var.projects
  scope                = azapi_resource.projects[each.key].id
  role_definition_name = "DevCenter Project Admin"
  principal_id         = data.azurerm_client_config.current.object_id
  depends_on = [
    azapi_resource.projects
  ]
}

resource "azurerm_role_assignment" "projects_key_vault_secret_user" {
  for_each             = var.projects
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azapi_resource.projects[each.key].output.identity.principalId
  depends_on = [
    azapi_resource.dev_center
  ]
}
