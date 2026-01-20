resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_cognitiveservices_azure_com" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.privatelink_cognitiveservices_azure_com.name)
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_cognitiveservices_azure_com.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
  tags                  = local.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_openai_azure_com" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.privatelink_openai_azure_com.name)
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_openai_azure_com.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
  tags                  = local.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_services_ai_azure_com" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.privatelink_services_ai_azure_com.name)
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_services_ai_azure_com.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
  tags                  = local.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_blob_core_windows_net" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.privatelink_blob_core_windows_net.name)
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_blob_core_windows_net.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
  tags                  = local.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_search_windows_net" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.privatelink_search_windows_net.name)
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_search_windows_net.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
  tags                  = local.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_documents_azure_com" {
  name                  = format("pdzvnl-%s", azurerm_private_dns_zone.privatelink_documents_azure_com.name)
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_documents_azure_com.name
  resource_group_name   = local.resource_group_name
  virtual_network_id    = azurerm_virtual_network.this.id
  tags                  = local.tags
}
