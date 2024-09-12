resource "azapi_resource" "eshop_internal_teams_frontend_project_pool" {
  type      = "Microsoft.DevCenter/projects/pools@2024-05-01-preview"
  name      = "internal-teams-win-11-frontend"
  location  = azurerm_resource_group.this.location
  parent_id = azurerm_dev_center_project.projects["eshop"].id
  tags      = local.tags_azapi
  body = jsonencode({
    properties = {
      devBoxDefinitionName  = azapi_resource.dotnet_dev_box_definition.name
      licenseType           = "Windows_Client"
      localAdministrator    = "Enabled"
      networkConnectionName = "managedNetwork"
      singleSignOnStatus    = "Enabled"
      virtualNetworkType    = "Managed"
      managedVirtualNetworkRegions = [
        azurerm_resource_group.this.location
      ]
      stopOnDisconnect = {
        gracePeriodMinutes = 60
        status             = "Enabled"
      }
    }
  })
}

resource "azapi_resource" "eshop_partners_teams_backend_project_pool" {
  type      = "Microsoft.DevCenter/projects/pools@2024-05-01-preview"
  name      = "partners-teams-win-11-backend"
  location  = azurerm_resource_group.this.location
  parent_id = azurerm_dev_center_project.projects["eshop"].id
  tags      = local.tags_azapi
  body = jsonencode({
    properties = {
      devBoxDefinitionName  = azapi_resource.java_dev_box_definition.name
      licenseType           = "Windows_Client"
      localAdministrator    = "Enabled"
      networkConnectionName = azapi_resource.attached_networks_eastus2.name
      singleSignOnStatus    = "Enabled"
      virtualNetworkType    = "Unmanaged"
      stopOnDisconnect = {
        gracePeriodMinutes = 60
        status             = "Enabled"
      }
    }
  })
}

resource "azapi_resource" "podcast_internal_teams_frontend_project_pool" {
  type      = "Microsoft.DevCenter/projects/pools@2024-05-01-preview"
  name      = "internal-teams-win-11-frontend"
  location  = azurerm_resource_group.this.location
  parent_id = azurerm_dev_center_project.projects["podcast"].id
  tags      = local.tags_azapi
  body = jsonencode({
    properties = {
      devBoxDefinitionName  = azapi_resource.go_dev_box_definition.name
      licenseType           = "Windows_Client"
      localAdministrator    = "Enabled"
      networkConnectionName = "managedNetwork"
      singleSignOnStatus    = "Enabled"
      virtualNetworkType    = "Managed"
      managedVirtualNetworkRegions = [
        azurerm_resource_group.this.location
      ]
      stopOnDisconnect = {
        gracePeriodMinutes = 60
        status             = "Enabled"
      }
    }
  })
}

resource "azapi_resource" "showcase_internal_teams_frontend_project_pool" {
  type      = "Microsoft.DevCenter/projects/pools@2024-05-01-preview"
  name      = "internal-teams-win-11-frontend"
  location  = azurerm_resource_group.this.location
  parent_id = azurerm_dev_center_project.projects["showcase"].id
  tags      = local.tags_azapi
  body = jsonencode({
    properties = {
      devBoxDefinitionName  = azapi_resource.dotnet_dev_box_definition.name
      licenseType           = "Windows_Client"
      localAdministrator    = "Enabled"
      networkConnectionName = "managedNetwork"
      singleSignOnStatus    = "Enabled"
      virtualNetworkType    = "Managed"
      managedVirtualNetworkRegions = [
        azurerm_resource_group.this.location
      ]
      stopOnDisconnect = {
        gracePeriodMinutes = 60
        status             = "Enabled"
      }
    }
  })
}

resource "azapi_resource" "showcase_partners_teams_backend_project_pool" {
  type      = "Microsoft.DevCenter/projects/pools@2024-05-01-preview"
  name      = "partners-teams-win-11-backend-api-1"
  location  = azurerm_resource_group.this.location
  parent_id = azurerm_dev_center_project.projects["showcase"].id
  tags      = local.tags_azapi
  body = jsonencode({
    properties = {
      devBoxDefinitionName  = azapi_resource.java_dev_box_definition.name
      licenseType           = "Windows_Client"
      localAdministrator    = "Enabled"
      networkConnectionName = azapi_resource.attached_networks_eastus2.name
      singleSignOnStatus    = "Enabled"
      virtualNetworkType    = "Unmanaged"
      stopOnDisconnect = {
        gracePeriodMinutes = 60
        status             = "Enabled"
      }
    }
  })
}

resource "azapi_resource" "showcase_internal_teams_backend_project_pool" {
  type      = "Microsoft.DevCenter/projects/pools@2024-05-01-preview"
  name      = "internal-teams-win-11-backend-api-2"
  location  = azurerm_resource_group.this.location
  parent_id = azurerm_dev_center_project.projects["showcase"].id
  tags      = local.tags_azapi
  body = jsonencode({
    properties = {
       devBoxDefinitionName  = azapi_resource.go_dev_box_definition.name
      licenseType           = "Windows_Client"
      localAdministrator    = "Enabled"
      networkConnectionName = "managedNetwork"
      singleSignOnStatus    = "Enabled"
      virtualNetworkType    = "Managed"
      managedVirtualNetworkRegions = [
        azurerm_resource_group.this.location
      ]
      stopOnDisconnect = {
        gracePeriodMinutes = 60
        status             = "Enabled"
      }
    }
  })
}
