resource "azurerm_private_dns_zone" "privatelink_azure_api_net" {
  name                = "privatelink.azure-api.net"
  resource_group_name = local.resource_group_name
  tags                = local.tags
}
