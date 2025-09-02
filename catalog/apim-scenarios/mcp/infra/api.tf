resource "azurerm_api_management_api" "pets_dev" {
  name                  = "pets-api"
  resource_group_name   = local.resource_group_name
  api_management_name   = azapi_resource.apim_dev.name
  revision              = "1"
  display_name          = "Pets"
  path                  = "api-pets"
  protocols             = ["https"]
  subscription_required = false
  import {
    content_format = "openapi+json-link"
    content_value  = "https://petstore3.swagger.io/api/v3/openapi.json"
  }
}

resource "azurerm_api_management_api" "pets_prod" {
  name                  = "pets-api"
  resource_group_name   = local.resource_group_name
  api_management_name   = azapi_resource.apim_prod.name
  revision              = "1"
  display_name          = "Pets"
  path                  = "api-pets"
  protocols             = ["https"]
  subscription_required = false
  import {
    content_format = "openapi+json-link"
    content_value  = "https://petstore3.swagger.io/api/v3/openapi.json"
  }
}

resource "azurerm_api_management_api" "colors_dev" {
  name                  = "colors-api"
  resource_group_name   = local.resource_group_name
  api_management_name   = azapi_resource.apim_dev.name
  revision              = "1"
  display_name          = "Colors"
  path                  = "api-colors"
  protocols             = ["https"]
  subscription_required = false
  import {
    content_format = "openapi+json-link"
    content_value  = "https://colors-api.azurewebsites.net/swagger/v1/swagger.json"
  }
}

resource "azurerm_api_management_api" "weather_mcp_dev" {
  name                  = "weather-mcp-api"
  resource_group_name   = local.resource_group_name
  api_management_name   = azapi_resource.apim_dev.name
  revision              = "1"
  display_name          = "Weather Basic MCP"
  path                  = "api-weather-mcp"
  protocols             = ["https"]
  subscription_required = false
  service_url           = format("https://%s", azurerm_container_app.weather_mcp.latest_revision_fqdn)
}

# resource "azapi_resource" "pets_api_mcp" {
#   type      = "Microsoft.ApiManagement/service/apis@2024-06-01-preview"
#   name      = format("%s/pets-mcp-api", azapi_resource.apim.name)
#   parent_id = azapi_resource.apim.id
#   body = {
#     properties = {
#       displayName          = "Pets MCP"
#       apiRevision          = "1"
#       subscriptionRequired = false
#       path                 = "api-pets-mcp"
#       protocols = ["https"]
#       authenticationSettings = {
#         openidAuthenticationSettings = []
#         oAuth2AuthenticationSettings = []
#       }
#       subscriptionKeyParameterNames = {
#         header = "Ocp-Apim-Subscription-Key"
#         query  = "subscription-key"
#       }
#       type      = "mcp"
#       isCurrent = true
#     }
#   }

#   depends_on = [
#     azapi_resource.apim
#   ]
# }

