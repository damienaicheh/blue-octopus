resource "azurerm_api_management_gateway" "region_1" {
  name              = format("SelfHostedGateway%s", title(var.location))
  api_management_id = azurerm_api_management.apim_prod.id
  description       = "API Management gateway in ${var.location}"

  location_data {
    name = var.location
  }
}

resource "azurerm_api_management_gateway_api" "colors_region_1_api" {
  gateway_id = azurerm_api_management_gateway.region_1.id
  api_id     = "${azurerm_api_management.apim_prod.id}/apis/${azurerm_api_management_api.colors_prod.name}"
}

resource "azurerm_api_management_gateway_api" "pets_region_1_api" {
  gateway_id = azurerm_api_management_gateway.region_1.id
  api_id     = "${azurerm_api_management.apim_prod.id}/apis/${azurerm_api_management_api.pets_prod.name}"
}

resource "azurerm_api_management_gateway" "region_2" {
  name              = format("SelfHostedGateway%s", title(var.location_2))
  api_management_id = azurerm_api_management.apim_prod.id
  description       = "API Management gateway in ${var.location_2}"

  location_data {
    name = var.location_2
  }
}

resource "azurerm_api_management_gateway_api" "colors_region_2_api" {
  gateway_id = azurerm_api_management_gateway.region_2.id
  api_id     = "${azurerm_api_management.apim_prod.id}/apis/${azurerm_api_management_api.colors_prod.name}"
}