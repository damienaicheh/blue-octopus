resource "azurerm_virtual_network_peering" "network_hub_to_network_dns" {
  name                         = format("peer-to-%s", azurerm_virtual_network.dns.name)
  resource_group_name          = local.resource_group_name
  virtual_network_name         = azurerm_virtual_network.hub.name
  remote_virtual_network_id    = azurerm_virtual_network.dns.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "network_dns_to_network_hub" {
  name                         = format("peer-to-%s", azurerm_virtual_network.hub.name)
  resource_group_name          = local.resource_group_name
  virtual_network_name         = azurerm_virtual_network.dns.name
  remote_virtual_network_id    = azurerm_virtual_network.hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "network_hub_to_network_spk1" {
  name                         = format("peer-to-%s", azurerm_virtual_network.spk1.name)
  resource_group_name          = local.resource_group_name
  virtual_network_name         = azurerm_virtual_network.hub.name
  remote_virtual_network_id    = azurerm_virtual_network.spk1.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "network_spk1_to_network_hub" {
  name                         = format("peer-to-%s", azurerm_virtual_network.hub.name)
  resource_group_name          = local.resource_group_name
  virtual_network_name         = azurerm_virtual_network.spk1.name
  remote_virtual_network_id    = azurerm_virtual_network.hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "network_spk2_to_network_hub" {
  name                         = format("peer-to-%s", azurerm_virtual_network.spk2.name)
  resource_group_name          = local.resource_group_name
  virtual_network_name         = azurerm_virtual_network.hub.name
  remote_virtual_network_id    = azurerm_virtual_network.spk2.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "network_hub_to_network_spk2" {
  name                         = format("peer-to-%s", azurerm_virtual_network.hub.name)
  resource_group_name          = local.resource_group_name
  virtual_network_name         = azurerm_virtual_network.spk2.name
  remote_virtual_network_id    = azurerm_virtual_network.hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "network_spk3_to_network_hub" {
  name                         = format("peer-to-%s", azurerm_virtual_network.spk3.name)
  resource_group_name          = local.resource_group_name
  virtual_network_name         = azurerm_virtual_network.hub.name
  remote_virtual_network_id    = azurerm_virtual_network.spk3.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "network_hub_to_network_spk3" {
  name                         = format("peer-to-%s", azurerm_virtual_network.hub.name)
  resource_group_name          = local.resource_group_name
  virtual_network_name         = azurerm_virtual_network.spk3.name
  remote_virtual_network_id    = azurerm_virtual_network.hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}
