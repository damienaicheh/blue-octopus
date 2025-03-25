resource "azurerm_private_dns_zone_virtual_network_link" "azurecontainerapps_io_dns" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.azurecontainerapps_io.name)
  private_dns_zone_name = azurerm_private_dns_zone.azurecontainerapps_io.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
  tags                  = local.tags
}