resource "azapi_resource" "projects" {
  for_each  = var.projects
  parent_id = azurerm_resource_group.this.id
  type      = "Microsoft.DevCenter/projects@2025-02-01"
  name      = each.value.name
  location  = azurerm_resource_group.this.location
  tags      = local.tags
  body = {
    identity = {
      type = "SystemAssigned"
    }
    properties = {
      catalogSettings = {
        catalogItemSyncTypes = compact([
          each.value.enable_environment_definition ? "EnvironmentDefinition" : "",
          each.value.enable_image_definition ? "ImageDefinition" : ""
        ])
      }
      description        = each.value.description
      devCenterId        = azapi_resource.dev_center.id
      displayName        = each.value.name
      maxDevBoxesPerUser = each.value.maximum_dev_boxes_per_user
    }
  }
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
