resource "azurerm_subnet" "paas_subnet" {
  name                 = "PaasSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [format("%s%s", var.vnet_address_prefix, var.paas_subnet_address_suffix)]
}

resource "azurerm_subnet" "app_service_subnet" {
  name                 = "AppServiceSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [format("%s%s", var.vnet_address_prefix, var.app_service_subnet_address_suffix)]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}
