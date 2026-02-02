resource "azapi_resource" "api_center" {
  type      = "Microsoft.ApiCenter/services@2024-06-01-preview"
  name      = format("apict-%s", local.resource_suffix_kebabcase)
  parent_id = local.resource_group_id
  identity {
    type = "SystemAssigned"
  }
  location = "eastus"
  tags     = local.tags
  body = {
    sku = {
      name = "Standard"
    }
  }
  schema_validation_enabled = false
}

resource "azapi_resource" "business_unit" {
  type      = "Microsoft.ApiCenter/services/metadataSchemas@2024-06-01-preview"
  name      = "business-unit"
  parent_id = azapi_resource.api_center.id
  body = {
    properties = {
      assignedTo = [
        {
          entity : "api",
          required : true,
          deprecated : false
        },
        {
          entity : "deployment",
          required : false,
          deprecated : false
        },
        {
          entity : "environment",
          required : false,
          deprecated : false
        }
      ]
      schema = "{\"type\":\"string\",\"title\":\"Business Unit\",\"description\":\"The business unit who manage the resource\",\"oneOf\":[{\"const\":\"Marketing\",\"description\":\"\"},{\"const\":\"Finance\",\"description\":\"\"},{\"const\":\"IT\",\"description\":\"\"},{\"const\":\"Sales\",\"description\":\"\"}]}"
    }
  }
}

resource "azapi_resource" "public_facing" {
  type      = "Microsoft.ApiCenter/services/metadataSchemas@2024-06-01-preview"
  name      = "public-facing"
  parent_id = azapi_resource.api_center.id
  body = {
    properties = {
      assignedTo = [
        {
          entity : "api",
          required : true,
          deprecated : false
        }
      ]
      schema = "{\"title\":\"Public Facing\",\"type\":\"boolean\"}"
    }
  }
}

resource "azapi_resource" "apim_dev_env" {
  type      = "Microsoft.ApiCenter/services/workspaces/environments@2024-06-01-preview"
  name      = azapi_resource.apim_dev.name
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${local.resource_group_name}/providers/Microsoft.ApiCenter/services/${azapi_resource.api_center.name}/workspaces/default"
  body = {
    properties = {
      title = azapi_resource.apim_dev.name
      kind  = "development"
      server = {
        managementPortalUri = []
        type                = "azure-api-management"
      }
      customProperties = {
        "business-unit" = "Finance"
      }
    }
  }
}

resource "azapi_resource" "integration_apim_dev" {
  type      = "Microsoft.ApiCenter/services/workspaces/apiSources@2024-06-01-preview"
  name      = azapi_resource.apim_dev.name
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${local.resource_group_name}/providers/Microsoft.ApiCenter/services/${azapi_resource.api_center.name}/workspaces/default"
  body = {
    properties = {
      azureApiManagementSource = {
        msiResourceId = "${data.azurerm_client_config.current.tenant_id}/${azapi_resource.api_center.identity[0].principal_id}/systemAssigned"
        resourceId    = azapi_resource.apim_dev.id
      }
      targetEnvironmentId  = "/workspaces/default/environments/${azapi_resource.apim_dev_env.name}"
      targetLifecycleStage = "development"
      importSpecification  = "always"
    }
  }

  depends_on = [
    azapi_resource.apim_dev,
    azurerm_role_assignment.api_center_apim_role_dev_env,
    azurerm_api_management_api.colors_dev,
    azurerm_api_management_api.pets_dev,
    azurerm_api_management_api.weather_mcp_dev
  ]
}

resource "azapi_resource" "apim_prod_env" {
  type      = "Microsoft.ApiCenter/services/workspaces/environments@2024-06-01-preview"
  name      = azapi_resource.apim_prod.name
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${local.resource_group_name}/providers/Microsoft.ApiCenter/services/${azapi_resource.api_center.name}/workspaces/default"
  body = {
    properties = {
      title = azapi_resource.apim_prod.name
      kind  = "production"
      server = {
        managementPortalUri = []
        type                = "azure-api-management"
      }
      customProperties = {
        "business-unit" = "Finance"
      }
    }
  }
}

# Can't run 2 APIM sync at the same time
resource "time_sleep" "wait_2_minutes" {
  depends_on = [azapi_resource.integration_apim_dev]

  create_duration = "2m"
}

resource "azapi_resource" "integration_apim_prod" {
  type      = "Microsoft.ApiCenter/services/workspaces/apiSources@2024-06-01-preview"
  name      = azapi_resource.apim_prod.name
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${local.resource_group_name}/providers/Microsoft.ApiCenter/services/${azapi_resource.api_center.name}/workspaces/default"
  body = {
    properties = {
      azureApiManagementSource = {
        msiResourceId = "${data.azurerm_client_config.current.tenant_id}/${azapi_resource.api_center.identity[0].principal_id}/systemAssigned"
        resourceId    = azapi_resource.apim_prod.id
      }
      targetEnvironmentId  = "/workspaces/default/environments/${azapi_resource.apim_prod_env.name}"
      targetLifecycleStage = "production"
      importSpecification  = "always"
    }
  }

  depends_on = [
    azapi_resource.apim_prod_env,
    azurerm_role_assignment.api_center_apim_role_prod_env,
    azurerm_api_management_api.pets_prod,
    time_sleep.wait_2_minutes
  ]
}
