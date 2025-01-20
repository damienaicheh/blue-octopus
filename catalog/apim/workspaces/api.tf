resource "azapi_resource" "colors_api" {
  type      = "Microsoft.ApiManagement/service/workspaces/apis@2023-09-01-preview"
  name      = "colors-api"
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${azurerm_api_management.this.resource_group_name}/providers/Microsoft.ApiManagement/service/${azurerm_api_management.this.name}/workspaces/${var.workspace.name}"
  body = jsonencode({
    properties = {
      apiRevision = "1"
      displayName = "Colors"
      format      = "openapi+json-link"
      path        = "colors"
      protocols   = ["https"]
      type        = "http"
      value       = "https://colors-api.azurewebsites.net/swagger/v1/swagger.json"
    }
  })
}

resource "azapi_resource" "pets_store_api_version_sets" {
  type      = "Microsoft.ApiManagement/service/workspaces/apiVersionSets@2023-09-01-preview"
  name      = "pets-store-api-version-sets"
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${azurerm_api_management.this.resource_group_name}/providers/Microsoft.ApiManagement/service/${azurerm_api_management.this.name}/workspaces/${var.workspace.name}"
  body = jsonencode({
    properties = {
      displayName       = "Pets Store Version Set"
      versionHeaderName = "Api-Version"
      versioningScheme  = "Header"
    }
  })
}

resource "azapi_resource" "pets_store_api" {
  type      = "Microsoft.ApiManagement/service/workspaces/apis@2023-09-01-preview"
  name      = "pets-store-api"
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${azurerm_api_management.this.resource_group_name}/providers/Microsoft.ApiManagement/service/${azurerm_api_management.this.name}/workspaces/${var.workspace.name}"
  body = jsonencode({
    properties = {
      apiRevision          = "1"
      apiVersion           = "3.0"
      apiType              = "http"
      apiVersionSetId      = azapi_resource.pets_store_api_version_sets.id
      displayName          = "Pets Store"
      format               = "openapi"
      path                 = "pets-store"
      protocols            = ["https"]
      type                 = "http"
      value                = data.template_file.pets_store_api.rendered
      serviceUrl           = "https://petstore3.swagger.io"
      subscriptionRequired = false
    }
  })
}
