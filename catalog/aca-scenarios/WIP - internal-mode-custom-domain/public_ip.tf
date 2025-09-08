resource "azurerm_public_ip" "appgw" {
  name                = format("pip-appgw-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = local.tags
}