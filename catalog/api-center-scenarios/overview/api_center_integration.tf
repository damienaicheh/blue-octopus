resource "azapi_resource" "integration_apim_dev" {
  type      = "Microsoft.ApiCenter/services/workspaces/apiSources@2024-06-01-preview"
  name      = azurerm_api_management.apim_dev.name
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${local.resource_group_name}/providers/Microsoft.ApiCenter/services/${azapi_resource.api_center.name}/workspaces/default"
  body = {
    properties = {
      azureApiManagementSource = {
        msiResourceId = "${data.azurerm_client_config.current.tenant_id}/${azapi_resource.api_center.identity[0].principal_id}/systemAssigned"
        resourceId    = azurerm_api_management.apim_dev.id
      }
      targetEnvironmentId  = "/workspaces/default/environments/${azapi_resource.apim_dev_env.name}"
      targetLifecycleStage = "development"
      importSpecification  = "always"
    }
  }

  # Source creation can return before the workspace import lock is released.
  retry = {
    error_message_regex = ["An API import operation is in progress for this workspace"]
    interval_seconds    = 15
  }

  depends_on = [
    azurerm_api_management.apim_dev,
    azurerm_role_assignment.api_center_apim_role_dev_env,
    azurerm_api_management_api.colors_dev,
    azurerm_api_management_api.pets_dev,
  ]
}


# Can't run 2 APIM sync at the same time
resource "time_sleep" "wait_2_minutes_after_apim_dev" {
  depends_on = [azapi_resource.integration_apim_dev]

  create_duration = "2m"
}

resource "azapi_resource" "integration_apim_prod" {
  type      = "Microsoft.ApiCenter/services/workspaces/apiSources@2024-06-01-preview"
  name      = azurerm_api_management.apim_prod.name
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${local.resource_group_name}/providers/Microsoft.ApiCenter/services/${azapi_resource.api_center.name}/workspaces/default"
  body = {
    properties = {
      azureApiManagementSource = {
        msiResourceId = "${data.azurerm_client_config.current.tenant_id}/${azapi_resource.api_center.identity[0].principal_id}/systemAssigned"
        resourceId    = azurerm_api_management.apim_prod.id
      }
      targetEnvironmentId  = "/workspaces/default/environments/${azapi_resource.apim_prod_env.name}"
      targetLifecycleStage = "production"
      importSpecification  = "always"
    }
  }

  retry = {
    error_message_regex = ["An API import operation is in progress for this workspace"]
    interval_seconds    = 15
  }

  depends_on = [
    azapi_resource.apim_prod_env,
    azurerm_role_assignment.api_center_apim_role_prod_env,
    azurerm_api_management_api.pets_prod,
    time_sleep.wait_2_minutes_after_apim_dev
  ]
}

# Keep sync operations serialized to avoid concurrent source imports.
resource "time_sleep" "wait_2_minutes_after_apim_prod" {
  depends_on = [azapi_resource.integration_apim_prod]

  create_duration = "2m"
}

resource "azapi_resource" "integration_azure_skills" {
  type      = "Microsoft.ApiCenter/services/workspaces/apiSources@2024-06-01-preview"
  name      = "azure-skills"
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${local.resource_group_name}/providers/Microsoft.ApiCenter/services/${azapi_resource.api_center.name}/workspaces/default"
  body = {
    properties = {
      apiSourceType = "Git"
      gitSource = {
        gitProvider   = "github"
        repositoryUrl = "https://github.com/microsoft/azure-skills/tree/main/.github/plugins/azure-skills/skills"
        assetTypes = [
          {
            assetType      = "skill"
            filesToInclude = "**/skill.md"
          }
        ]
      }
      targetEnvironmentId  = "/workspaces/default/environments/${azapi_resource.github_env.name}"
      targetLifecycleStage = "design"
      importSpecification  = "ondemand"
    }
  }

  schema_validation_enabled = false

  retry = {
    error_message_regex = ["An API import operation is in progress for this workspace"]
    interval_seconds    = 15
  }

  depends_on = [
    azapi_resource.github_env,
    time_sleep.wait_2_minutes_after_apim_prod
  ]
}


# Keep sync operations serialized to avoid concurrent source imports.
resource "time_sleep" "wait_2_minutes_after_azure_skills" {
  depends_on = [azapi_resource.integration_azure_skills]

  create_duration = "2m"
}

resource "azapi_resource" "integration_microsoft_mcp" {
  type      = "Microsoft.ApiCenter/services/workspaces/apiSources@2024-06-01-preview"
  name      = "microsoft-mcp"
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${local.resource_group_name}/providers/Microsoft.ApiCenter/services/${azapi_resource.api_center.name}/workspaces/default"
  body = {
    properties = {
      apiSourceType = "Git"
      gitSource = {
        gitProvider   = "github"
        repositoryUrl = "https://github.com/microsoft/mcp/tree/main/servers"
        assetTypes = [
          {
            assetType      = "mcp-server"
            filesToInclude = "Azure.Mcp.Server/server.json"
          },
          {
            assetType      = "mcp-server"
            filesToInclude = "Fabric.Mcp.Server/server.json"
          }
        ]
      }
      targetEnvironmentId  = "/workspaces/default/environments/${azapi_resource.github_env.name}"
      targetLifecycleStage = "design"
      importSpecification  = "ondemand"
    }
  }

  schema_validation_enabled = false

  retry = {
    error_message_regex = ["An API import operation is in progress for this workspace"]
    interval_seconds    = 15
  }

  depends_on = [
    azapi_resource.github_env,
    time_sleep.wait_2_minutes_after_azure_skills
  ]
}