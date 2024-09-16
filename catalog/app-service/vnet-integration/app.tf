resource "azurerm_service_plan" "this" {
  name                = format("asp-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  os_type             = "Linux"
  sku_name            = var.app_service_plan_sku
  tags                = local.tags
}

resource "azurerm_linux_web_app" "this" {
  name                                           = format("app-%s", local.resource_suffix_kebabcase)
  resource_group_name                            = local.resource_group_name
  location                                       = azurerm_service_plan.this.location
  service_plan_id                                = azurerm_service_plan.this.id
  public_network_access_enabled                  = false
  ftp_publish_basic_authentication_enabled       = false
  webdeploy_publish_basic_authentication_enabled = false
  virtual_network_subnet_id                      = azurerm_subnet.app_service_subnet.id
  tags                                           = local.tags

  site_config {
    application_stack {
      dotnet_version = "8.0"
    }
  }
}
