resource "azurerm_public_ip" "firewall" {
  name                = format("pip-afw-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.tags
}

resource "azurerm_public_ip" "firewall_management" {
  name                = format("pip-afw-mgt-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.tags
}