resource "azurerm_api_management" "this" {
  name                = format("apim-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  publisher_name      = "Me"
  publisher_email     = "admin@me.io"
  sku_name            = "Basic_1"
  tags                = local.tags

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_api_management_logger" "this" {
  name                = format("apim-logger-%s", local.resource_suffix_kebabcase)
  api_management_name = azurerm_api_management.this.name
  resource_group_name = local.resource_group_name
  resource_id         = azurerm_application_insights.this.id
  buffered            = false

  application_insights {
    instrumentation_key = azurerm_application_insights.this.instrumentation_key
  }

  depends_on = [
    azurerm_application_insights.this,
    azurerm_api_management.this
  ]
}
