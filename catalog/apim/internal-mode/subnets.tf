# Primary region

resource "azurerm_subnet" "subnet_bastion_spk1" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.spk1.name
  address_prefixes     = [format("%s%s", var.vnet_spk1_address_prefix, var.bastion_subnet_address_suffix)]
}

resource "azurerm_subnet" "subnet_apim_spk1" {
  name                 = "ApimSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.spk1.name
  address_prefixes     = [format("%s%s", var.vnet_spk1_address_prefix, var.apim_subnet_address_suffix)]
}