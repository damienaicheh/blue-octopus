resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.app_service.name)
  private_dns_zone_name = azurerm_private_dns_zone.app_service.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "sto_blob" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.sto_blob.name)
  private_dns_zone_name = azurerm_private_dns_zone.sto_blob.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "sto_file" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.sto_file.name)
  private_dns_zone_name = azurerm_private_dns_zone.sto_file.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "sto_queue" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.sto_queue.name)
  private_dns_zone_name = azurerm_private_dns_zone.sto_queue.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "sto_table" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.sto_table.name)
  private_dns_zone_name = azurerm_private_dns_zone.sto_table.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
}
