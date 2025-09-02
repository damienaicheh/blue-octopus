resource "azurerm_api_management_api_operation" "weather_mcp_messages" {
  operation_id        = "post-messages"
  api_name            = azurerm_api_management_api.weather_mcp_dev.name
  api_management_name = azurerm_api_management_api.weather_mcp_dev.api_management_name
  resource_group_name = azurerm_api_management_api.weather_mcp_dev.resource_group_name
  display_name        = "messages"
  method              = "POST"
  url_template        = "/messages/"
  description         = "Post messages."

  request {
    header {
      name     = "Content-Type"
      required = true
      type     = "string"
    }
  }

  response {
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation" "weather_mcp_dev_sse" {
  operation_id        = "get-sse"
  api_name            = azurerm_api_management_api.weather_mcp_dev.name
  api_management_name = azurerm_api_management_api.weather_mcp_dev.api_management_name
  resource_group_name = azurerm_api_management_api.weather_mcp_dev.resource_group_name
  display_name        = "sse"
  method              = "GET"
  url_template        = "/sse"
  description         = "Get sse."

  request {
    header {
      name     = "Content-Type"
      required = true
      type     = "string"
    }
  }

  response {
    status_code = 200
  }
}
