resource "azurerm_api_management" "apim_dev" {
  name                = format("apim-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags
  publisher_name      = "Me"
  publisher_email     = "admin@me.io"

  sku_name = "BasicV2_1"

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_api_management" "apim_prod" {
  name                = replace(format("apim-%s", local.resource_suffix_kebabcase), var.environment, "prd")
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags
  publisher_name      = "Me"
  publisher_email     = "admin@me.io"

  sku_name = "Developer_1"

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_api_management_logger" "this" {
  name                = format("apim-logger-%s", local.resource_suffix_kebabcase)
  api_management_name = azurerm_api_management.apim_prod.name
  resource_group_name = local.resource_group_name
  resource_id         = azurerm_application_insights.this.id
  buffered            = false

  application_insights {
    instrumentation_key = azurerm_application_insights.this.instrumentation_key
  }

  depends_on = [
    azurerm_application_insights.this,
    azurerm_api_management.apim_prod
  ]
}
