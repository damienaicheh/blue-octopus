resource "azurerm_virtual_network" "east_us_2" {
  name                = format("vnet-%s", local.resource_suffix_kebabcase)
  address_space       = [format("%s%s", var.vnet_address_prefix, var.vnet_address_suffix)]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = local.tags
}

resource "azurerm_subnet" "dev_boxes" {
  name                 = "EastUs2DevBoxesSubnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.east_us_2.name
  address_prefixes     = [format("%s%s", var.vnet_address_prefix, var.dev_boxes_subnet_address_suffix)]
}