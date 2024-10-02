resource "azurerm_private_dns_zone" "azure_api_net" {
  name                = "azure-api.net"
  resource_group_name = local.resource_group_name
  tags                = local.tags
}

resource "azurerm_private_dns_a_record" "default_gateway_azure_api_net" {
  name                = format("%s", azurerm_api_management.this.name)
  zone_name           = azurerm_private_dns_zone.azure_api_net.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [azurerm_api_management.this.private_ip_addresses[0]]
}

resource "azurerm_private_dns_a_record" "portal_azure_api_net" {
  name                = format("%s.portal", azurerm_api_management.this.name)
  zone_name           = azurerm_private_dns_zone.azure_api_net.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [azurerm_api_management.this.private_ip_addresses[0]]
}

resource "azurerm_private_dns_a_record" "management_azure_api_net" {
  name                = format("%s.management", azurerm_api_management.this.name)
  zone_name           = azurerm_private_dns_zone.azure_api_net.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [azurerm_api_management.this.private_ip_addresses[0]]
}

resource "azurerm_private_dns_a_record" "scm_azure_api_net" {
  name                = format("%s.scm", azurerm_api_management.this.name)
  zone_name           = azurerm_private_dns_zone.azure_api_net.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [azurerm_api_management.this.private_ip_addresses[0]]
}

resource "azurerm_private_dns_a_record" "developer_azure_api_net" {
  name                = format("%s.developer", azurerm_api_management.this.name)
  zone_name           = azurerm_private_dns_zone.azure_api_net.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [azurerm_api_management.this.private_ip_addresses[0]]
}

resource "azurerm_private_dns_a_record" "eus2_regional_azure_api_net" {
  name                = format("%s-eastus2-01.regional", azurerm_api_management.this.name)
  zone_name           = azurerm_private_dns_zone.azure_api_net.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [azurerm_api_management.this.private_ip_addresses[0]]
}