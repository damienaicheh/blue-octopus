resource "azurerm_api_management_api_operation" "random_colors" {
  operation_id        = "random-colors"
  api_name            = azurerm_api_management_api.colors.name
  api_management_name = azurerm_api_management.this.name
  resource_group_name = local.resource_group_name
  display_name        = "Random colors"
  method              = "GET"
  url_template        = "/colors/random"
  description         = "Random colors."

  response {
    status_code = 200
  }
}


resource "azurerm_api_management_api_operation" "get_colors" {
  operation_id        = "get-colors"
  api_name            = azurerm_api_management_api.colors.name
  api_management_name = azurerm_api_management.this.name
  resource_group_name = local.resource_group_name
  display_name        = "Get colors"
  method              = "GET"
  url_template        = "/colors"
  description         = "Get colors."

  response {
    status_code = 200
  }
}
