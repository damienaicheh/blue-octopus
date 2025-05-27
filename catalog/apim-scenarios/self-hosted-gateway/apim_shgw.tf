resource "azurerm_api_management_gateway" "this" {
  name              = "SelfHostedGatewayEastUs2"
  api_management_id = azurerm_api_management.this.id
  description       = "Example API Management gateway"

  location_data {
    name = "eastus2"
  }
}

resource "azurerm_api_management_gateway_api" "colors_api" {
  gateway_id = azurerm_api_management_gateway.this.id
  api_id     = azurerm_api_management_api.colors.id
}
