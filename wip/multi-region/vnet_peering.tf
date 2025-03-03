resource "azurerm_virtual_network_peering" "spk1" {
  name                      = format("peer-to-%s", azurerm_virtual_network.spk2.name)
  resource_group_name       = local.resource_group_name
  virtual_network_name      = azurerm_virtual_network.spk1.name
  remote_virtual_network_id = azurerm_virtual_network.spk2.id
}

resource "azurerm_virtual_network_peering" "spk2" {
  name                      = format("peer-to-%s", azurerm_virtual_network.spk1.name)
  resource_group_name       = local.resource_group_name
  virtual_network_name      = azurerm_virtual_network.spk2.name
  remote_virtual_network_id = azurerm_virtual_network.spk1.id
}