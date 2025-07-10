resource "azurerm_api_management_api" "pets" {
  name                  = "pets-api"
  resource_group_name   = local.resource_group_name
  api_management_name   = azapi_resource.apim.name
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

resource "azurerm_api_management_api" "weather_mcp" {
  name                  = "weather-mcp-api"
  resource_group_name   = local.resource_group_name
  api_management_name   = azapi_resource.apim.name
  revision              = "1"
  display_name          = "Weather MCP"
  path                  = "api-weather-mcp"
  protocols             = ["https"]
  subscription_required = false
  service_url           = format("https://%s", azurerm_container_app.weather_mcp.latest_revision_fqdn)
}
