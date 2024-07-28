resource "azurerm_dev_center_project" "projects" {
  for_each                   = var.projects
  dev_center_id              = azurerm_dev_center.this.id
  location                   = azurerm_resource_group.this.location
  name                       = each.value.name
  resource_group_name        = azurerm_resource_group.this.name
  maximum_dev_boxes_per_user = each.value.maximum_dev_boxes_per_user
  tags                       = local.tags
}

resource "azapi_resource" "projects_env_types" {
  for_each  = { for idx, project in local.projects_env_types : idx => project }
  type      = "Microsoft.DevCenter/projects/environmentTypes@2023-04-01"
  name      = each.value.env_type
  location  = azurerm_resource_group.this.location
  parent_id = azurerm_dev_center_project.projects[each.value.name].id

  tags = merge(
    local.tags_azapi,
    tomap(
      {
        "DevCenterProjectName"   = each.value.name,
        "ProjectEnvironmentType" = each.value.env_type,
      }
    )
  )

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.projects_acr.id
    ]
  }

  body = jsonencode({
    properties = {
      creatorRoleAssignment = {
        roles = {
          # "45d50f46-0b78-4001-a660-4198cbe8cd05" = {} // DevCenter Dev Box User
          "b24988ac-6180-42a0-ab88-20f7382dd24c" = {}
        }
      }
      deploymentTargetId = data.azurerm_subscription.primary.id
      status             = "Enabled"
      # userRoleAssignments = {
      #   data.azurerm_client_config.current.object_id = "45d50f46-0b78-4001-a660-4198cbe8cd05"
      # }
    }
  })
}
