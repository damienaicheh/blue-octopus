resource "azurerm_private_dns_zone_virtual_network_link" "contoso_net_dns" {
  name                  = format("pdzvnl-eus2-%s", azurerm_private_dns_zone.contoso_net.name)
  private_dns_zone_name = azurerm_private_dns_zone.contoso_net.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.dns.id
  tags                  = local.tags
}