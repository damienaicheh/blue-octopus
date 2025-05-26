resource "azapi_resource" "colors_api" {
  type      = "Microsoft.ApiManagement/service/workspaces/apis@2023-09-01-preview"
  name      = "colors-api"
  parent_id = local.workspace_1_id
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
  depends_on = [
    azapi_resource.workspace_1
  ]
}

resource "azapi_resource" "pets_store_api_version_sets" {
  type      = "Microsoft.ApiManagement/service/workspaces/apiVersionSets@2023-09-01-preview"
  name      = "pets-store-api-version-sets"
  parent_id = local.workspace_1_id
  body = jsonencode({
    properties = {
      displayName       = "Pets Store Version Set"
      versionHeaderName = "Api-Version"
      versioningScheme  = "Header"
    }
  })
  depends_on = [
    azapi_resource.workspace_1
  ]
}

resource "azapi_resource" "pets_store_api" {
  type      = "Microsoft.ApiManagement/service/workspaces/apis@2023-09-01-preview"
  name      = "pets-store-api"
  parent_id = local.workspace_1_id
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
  depends_on = [
    azapi_resource.workspace_1
  ]
}
