resource "azurerm_subnet" "subnet_host_agent" {
  name                 = "HostsAgentSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [format("%s%s", var.vnet_address_prefix, var.hosts_agent_subnet_address_suffix)]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.App/environments"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_subnet" "subnet_paas" {
  name                 = "PaasSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [format("%s%s", var.vnet_address_prefix, var.paas_subnet_address_suffix)]
}
