resource "azurerm_virtual_network" "spk1" {
  name                = format("vnet-spk1-%s", local.resource_suffix_kebabcase)
  address_space       = [format("%s%s", var.vnet_spk1_address_prefix, var.vnet_address_suffix)]
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags
}
