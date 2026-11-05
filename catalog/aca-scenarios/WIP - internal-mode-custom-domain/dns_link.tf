resource "azurerm_private_dns_zone_virtual_network_link" "cae_default_domain" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.cae_default_domain.name)
  private_dns_zone_name = azurerm_private_dns_zone.cae_default_domain.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
  tags                  = local.tags
}