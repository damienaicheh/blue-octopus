resource "azurerm_subnet" "subnet_appgw_spk1" {
  name                 = "AppGwSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [format("%s%s", var.vnet_address_prefix, var.appgw_subnet_address_suffix)]
}

resource "azurerm_subnet" "subnet_bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [format("%s%s", var.vnet_address_prefix, var.bastion_subnet_address_suffix)]
}

resource "azurerm_subnet" "subnet_container_app_environment" {
  name                 = "AzureContainerAppEnvironmentSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [format("%s%s", var.vnet_address_prefix, var.container_app_environment_subnet_address_suffix)]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.App/environments"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}
