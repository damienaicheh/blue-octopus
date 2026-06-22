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