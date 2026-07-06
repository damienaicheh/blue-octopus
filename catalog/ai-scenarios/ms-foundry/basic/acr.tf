resource "azurerm_container_registry" "this" {
  name                          = format("acr%s", local.resource_suffix_lowercase)
  resource_group_name           = local.resource_group_name
  location                      = local.resource_group_location
  sku                           = "Basic"
  admin_enabled                 = true
  public_network_access_enabled = true
  anonymous_pull_enabled        = false
  data_endpoint_enabled         = false
  tags                          = local.tags

  identity {
    type = "SystemAssigned"
  }
}
