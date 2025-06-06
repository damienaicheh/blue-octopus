resource "azurerm_private_dns_zone" "cae_default_domain" {
  name                = azurerm_container_app_environment.this.default_domain
  resource_group_name = local.resource_group_name
  tags                = local.tags
}

resource "azurerm_private_dns_a_record" "all" {
  name                = "*"
  zone_name           = azurerm_private_dns_zone.cae_default_domain.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [azurerm_container_app_environment.this.static_ip_address]
}

resource "azurerm_private_dns_a_record" "at" {
  name                = "@"
  zone_name           = azurerm_private_dns_zone.cae_default_domain.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [azurerm_container_app_environment.this.static_ip_address]
}

resource "azurerm_private_dns_zone" "container_registry" {
  name                = "privatelink.azurecr.io"
  resource_group_name = local.resource_group_name
  tags                = local.tags
}

resource "azurerm_private_dns_zone" "web" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = local.resource_group_name
  tags                = local.tags
}