resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.privatelink_azurewebsites_net.name)
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azurewebsites_net.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "sto_blob" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.privatelink_blob_core_windows_net.name)
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_blob_core_windows_net.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "sto_file" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.privatelink_file_core_windows_net.name)
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_file_core_windows_net.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "sto_queue" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.privatelink_queue_core_windows_net.name)
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_queue_core_windows_net.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "sto_table" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.privatelink_table_core_windows_net.name)
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_table_core_windows_net.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
}
