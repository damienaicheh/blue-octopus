resource "azurerm_subnet" "subnet_apim_spk1" {
  name                 = "ApimSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.spk1.name
  address_prefixes     = [format("%s%s", var.vnet_spk1_address_prefix, var.apim_subnet_address_suffix)]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }

}

resource "azurerm_subnet" "subnet_paas_spk1" {
  name                 = "PaasSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.spk1.name
  address_prefixes     = [format("%s%s", var.vnet_spk1_address_prefix, var.paas_subnet_address_suffix)]
}

resource "azurerm_subnet" "subnet_bastion_spk1" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.spk1.name
  address_prefixes     = [format("%s%s", var.vnet_spk1_address_prefix, var.bastion_subnet_address_suffix)]
}

resource "azurerm_subnet" "subnet_vm_spk1" {
  name                 = "VmSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.spk1.name
  address_prefixes     = [format("%s%s", var.vnet_spk1_address_prefix, var.vm_subnet_address_suffix)]
}
