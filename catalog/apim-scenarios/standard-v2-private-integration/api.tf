resource "azapi_resource" "colors_api" {
  type      = "Microsoft.ApiManagement/service/apis@2024-06-01-preview"
  name      = "colors-api"
  parent_id = azapi_resource.apim.id
  body = {
    properties = {
      apiRevision = "1"
      displayName = "Colors"
      format      = "openapi+json-link"
      path        = "colors"
      protocols   = ["https"]
      type        = "http"
      value       = "https://colors-api.azurewebsites.net/swagger/v1/swagger.json"
    }
  }
}