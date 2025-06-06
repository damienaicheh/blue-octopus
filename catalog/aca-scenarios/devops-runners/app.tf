resource "azurerm_linux_web_app" "this" {
  name                          = format("app-%s", local.resource_suffix_kebabcase)
  resource_group_name           = local.resource_group_name
  location                      = local.resource_group_location
  service_plan_id               = azurerm_service_plan.this.id
  public_network_access_enabled = false
  virtual_network_subnet_id     = azurerm_subnet.subnet_app_service.id

  identity {
    type = "SystemAssigned"
  }

  site_config {
    
    application_stack {
      python_version = "3.9"
    }
  }
}