resource "azurerm_subnet" "subnet_bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [format("%s%s", var.vnet_address_prefix, var.bastion_subnet_address_suffix)]
}

resource "azurerm_subnet" "subnet_paas" {
  name                 = "PaasSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [format("%s%s", var.vnet_address_prefix, var.paas_subnet_address_suffix)]
}

resource "azurerm_subnet" "subnet_func_plan" {
  name                 = "FuncPlanSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [format("%s%s", var.vnet_address_prefix, var.func_subnet_address_suffix)]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}