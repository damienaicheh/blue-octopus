resource "azurerm_private_dns_zone" "azurecontainerapps_io" {
  name                = "azurecontainerapps.io"
  resource_group_name = local.resource_group_name
  tags                = local.tags
}

resource "azurerm_private_dns_cname_record" "ca_hello_world" {
  name                = azurerm_container_app.hello_world.latest_revision_fqdn
  zone_name           = azurerm_private_dns_zone.azurecontainerapps_io.name
  resource_group_name = local.resource_group_name
  ttl                 = 300
  record              = split(".${azurerm_private_dns_zone.azurecontainerapps_io.name}", azurerm_container_app.hello_world.latest_revision_fqdn)[0]
}

output "latest_revision_fqdn" {
  value = azurerm_container_app.hello_world.latest_revision_fqdn
}

output "latest_revision_name" {
  value = azurerm_container_app.hello_world.latest_revision_name
}

# resource "azurerm_private_dns_a_record" "default_gateway_azure_api_net" {
#   name                = format("%s", azurerm_api_management.this.name)
#   zone_name           = azurerm_private_dns_zone.azure_api_net.name
#   resource_group_name = local.resource_group_name
#   ttl                 = 3600
#   records             = [azurerm_api_management.this.private_ip_addresses[0]]
# }
