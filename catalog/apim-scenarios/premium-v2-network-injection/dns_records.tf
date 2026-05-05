
data "azapi_resource" "apim_service" {
  type        = "Microsoft.ApiManagement/service@2025-03-01-preview"
  resource_id = azurerm_api_management.this.id

  response_export_values = ["properties.privateIPAddresses"]

  timeouts {
    read = "5m"
  }

  depends_on = [
    azurerm_api_management.this,
  ]
}

locals {
  apim_private_ip_address = try(
    data.azapi_resource.apim_service.output.properties.privateIPAddresses[0],
    cidrhost(azurerm_subnet.subnet_apim.address_prefixes[0], 4)
  )
}

resource "azurerm_private_dns_a_record" "portal_azure_api_net" {
  name                = format("%s.portal", azurerm_api_management.this.name)
  zone_name           = azurerm_private_dns_zone.privatelink_azure_api_net.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [local.apim_private_ip_address]
  depends_on = [
    azurerm_private_endpoint.apim_gateway
  ]
}

resource "azurerm_private_dns_a_record" "management_azure_api_net" {
  name                = format("%s.management", azurerm_api_management.this.name)
  zone_name           = azurerm_private_dns_zone.privatelink_azure_api_net.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [local.apim_private_ip_address]
  depends_on = [
    azurerm_private_endpoint.apim_gateway
  ]
}

resource "azurerm_private_dns_a_record" "scm_azure_api_net" {
  name                = format("%s.scm", azurerm_api_management.this.name)
  zone_name           = azurerm_private_dns_zone.privatelink_azure_api_net.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [local.apim_private_ip_address]
  depends_on = [
    azurerm_private_endpoint.apim_gateway
  ]
}

resource "azurerm_private_dns_a_record" "developer_azure_api_net" {
  name                = format("%s.developer", azurerm_api_management.this.name)
  zone_name           = azurerm_private_dns_zone.privatelink_azure_api_net.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [local.apim_private_ip_address]
  depends_on = [
    azurerm_private_endpoint.apim_gateway
  ]
}
