resource "azurerm_subnet" "subnet_bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = [format("%s%s", var.vnet_hub_address_prefix, var.bastion_subnet_address_suffix)]
}

resource "azurerm_subnet" "subnet_paas_spk1" {
  name                 = "PaasSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.spk1.name
  address_prefixes     = [format("%s%s", var.vnet_spk1_address_prefix, var.paas_subnet_address_suffix)]
}

resource "azurerm_subnet" "subnet_paas_spk2" {
  name                 = "PaasSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.spk2.name
  address_prefixes     = [format("%s%s", var.vnet_spk2_address_prefix, var.paas_subnet_address_suffix)]
}

resource "azurerm_subnet" "subnet_paas_spk3" {
  name                 = "PaasSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.spk3.name
  address_prefixes     = [format("%s%s", var.vnet_spk3_address_prefix, var.paas_subnet_address_suffix)]
}