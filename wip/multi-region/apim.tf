resource "azurerm_api_management" "this" {
  name                 = format("apim-%s", local.resource_suffix_kebabcase)
  location             = local.resource_group_location
  resource_group_name  = local.resource_group_name
  publisher_name       = "Me"
  publisher_email      = "admin@me.io"
  virtual_network_type = "Internal"
  sku_name             = var.apim_sku_name
  tags                 = local.tags

  identity {
    type = "SystemAssigned"
  }

  virtual_network_configuration {
    subnet_id = azurerm_subnet.subnet_apim_spk1.id
  }

  additional_location {
    location = var.location_spk2
    capacity = 1
    zones    = []
    virtual_network_configuration {
      subnet_id = azurerm_subnet.subnet_apim_spk2.id
    }
  }

  depends_on = [
    azurerm_subnet.subnet_apim_spk1,
    azurerm_subnet.subnet_apim_spk2,
    azurerm_network_security_group.apim_spk1,
    azurerm_network_security_group.apim_spk2,
    azurerm_subnet_network_security_group_association.apim_spk1,
    azurerm_subnet_network_security_group_association.apim_spk2,
    azurerm_private_dns_zone.azure_api_net,
  ]
}

resource "azurerm_api_management_logger" "this" {
  name                = format("apim-logger-%s", local.resource_suffix_kebabcase)
  api_management_name = azurerm_api_management.this.name
  resource_group_name = azurerm_api_management.this.resource_group_name
  resource_id         = azurerm_application_insights.this.id

  application_insights {
    instrumentation_key = azurerm_application_insights.this.instrumentation_key
  }

  depends_on = [
    azurerm_application_insights.this,
    azurerm_api_management.this
  ]
}
