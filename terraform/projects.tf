resource "azurerm_dev_center_project" "projects" {
  for_each                   = var.projects
  dev_center_id              = local.reformat_dev_center_id
  location                   = azurerm_resource_group.this.location
  name                       = each.value.name
  resource_group_name        = azurerm_resource_group.this.name
  maximum_dev_boxes_per_user = each.value.maximum_dev_boxes_per_user
  tags                       = local.tags
}

# resource "azurerm_dev_center_project_environment_type" "projects_env_types" {
#   for_each              = { for idx, project in local.projects_env_types : project.id => project }
#   name                  = each.value.env_type
#   location              = azurerm_resource_group.this.location
#   dev_center_project_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${azurerm_resource_group.this.name}/providers/Microsoft.DevCenter/projects/${each.value.name}"
#   deployment_target_id  = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"

#   tags = local.tags

#   identity {
#     type = "UserAssigned"
#     identity_ids = [
#       azurerm_user_assigned_identity.projects_acr.id
#     ]
#   }

#   creator_role_assignment_roles = [
#     "b24988ac-6180-42a0-ab88-20f7382dd24c" // Contributor
#   ]
# }