resource "azurerm_virtual_network" "this" {
  name                = format("vnet-%s", local.resource_suffix_kebabcase)
  address_space       = [format("%s%s", var.vnet_address_prefix, var.vnet_address_suffix)]
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags
}