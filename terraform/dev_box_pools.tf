# resource "azapi_resource" "eshop_internal_teams_frontend_project_pool" {
#   type      = "Microsoft.DevCenter/projects/pools@2024-05-01-preview"
#   name      = "internal-teams-win-11-frontend"
#   location  = azurerm_resource_group.this.location
#   parent_id = azapi_resource.projects["eshop"].id
#   tags      = local.tags_azapi
#   body = {
#     properties = {
#       devBoxDefinitionName  = azapi_resource.dotnet_dev_box_definition.name
#       licenseType           = "Windows_Client"
#       localAdministrator    = "Enabled"
#       networkConnectionName = "managedNetwork"
#       singleSignOnStatus    = "Enabled"
#       virtualNetworkType    = "Managed"
#       managedVirtualNetworkRegions = [
#         azurerm_resource_group.this.location
#       ]
#       stopOnDisconnect = {
#         gracePeriodMinutes = 60
#         status             = "Enabled"
#       }
#     }
#   }
# }

# resource "azapi_resource" "eshop_partners_teams_backend_project_pool" {
#   type      = "Microsoft.DevCenter/projects/pools@2024-05-01-preview"
#   name      = "partners-teams-win-11-backend"
#   location  = azurerm_resource_group.this.location
#   parent_id = azapi_resource.projects["eshop"].id
#   tags      = local.tags_azapi
#   body = {
#     properties = {
#       devBoxDefinitionName  = azapi_resource.java_dev_box_definition.name
#       licenseType           = "Windows_Client"
#       localAdministrator    = "Enabled"
#       networkConnectionName = azapi_resource.attached_networks_germany_west_central.name
#       singleSignOnStatus    = "Enabled"
#       virtualNetworkType    = "Unmanaged"
#       stopOnDisconnect = {
#         gracePeriodMinutes = 60
#         status             = "Enabled"
#       }
#     }
#   }
# }

# resource "azapi_resource" "research_internal_teams_frontend_project_pool" {
#   type      = "Microsoft.DevCenter/projects/pools@2024-05-01-preview"
#   name      = "internal-teams-win-11-frontend"
#   location  = azurerm_resource_group.this.location
#   parent_id = azapi_resource.projects["research"].id
#   tags      = local.tags_azapi
#   body = {
#     properties = {
#       devBoxDefinitionName  = azapi_resource.dotnet_dev_box_definition.name
#       licenseType           = "Windows_Client"
#       localAdministrator    = "Enabled"
#       networkConnectionName = "managedNetwork"
#       singleSignOnStatus    = "Enabled"
#       virtualNetworkType    = "Managed"
#       managedVirtualNetworkRegions = [
#         azurerm_resource_group.this.location
#       ]
#       stopOnDisconnect = {
#         gracePeriodMinutes = 60
#         status             = "Enabled"
#       }
#     }
#   }
# }

# resource "azapi_resource" "research_partners_teams_backend_project_pool" {
#   type      = "Microsoft.DevCenter/projects/pools@2024-05-01-preview"
#   name      = "partners-teams-win-11-backent-agents-ai"
#   location  = azurerm_resource_group.this.location
#   parent_id = azapi_resource.projects["research"].id
#   tags      = local.tags_azapi
#   body = {
#     properties = {
#       devBoxDefinitionName  = azapi_resource.java_dev_box_definition.name
#       licenseType           = "Windows_Client"
#       localAdministrator    = "Enabled"
#       networkConnectionName = azapi_resource.attached_networks_germany_west_central.name
#       singleSignOnStatus    = "Enabled"
#       virtualNetworkType    = "Unmanaged"
#       stopOnDisconnect = {
#         gracePeriodMinutes = 60
#         status             = "Enabled"
#       }
#     }
#   }
# }

# resource "azapi_resource" "research_internal_teams_data_scientist_project_pool" {
#   type      = "Microsoft.DevCenter/projects/pools@2024-05-01-preview"
#   name      = "internal-teams-win-11-data-scientist"
#   location  = azurerm_resource_group.this.location
#   parent_id = azapi_resource.projects["research"].id
#   tags      = local.tags_azapi
#   body = {
#     properties = {
#       devBoxDefinitionName  = azapi_resource.go_dev_box_definition.name
#       licenseType           = "Windows_Client"
#       localAdministrator    = "Enabled"
#       networkConnectionName = "managedNetwork"
#       singleSignOnStatus    = "Enabled"
#       virtualNetworkType    = "Managed"
#       managedVirtualNetworkRegions = [
#         azurerm_resource_group.this.location
#       ]
#       stopOnDisconnect = {
#         gracePeriodMinutes = 60
#         status             = "Enabled"
#       }
#     }
#   }
# }
