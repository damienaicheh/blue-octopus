resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azure_api_net_dns" {
  name                  = format("pdzvnl-eus2-%s", azurerm_private_dns_zone.privatelink_azure_api_net.name)
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azure_api_net.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.spk1.id
  tags                  = local.tags
}