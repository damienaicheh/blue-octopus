resource "azurerm_private_endpoint" "apim_gateway" {
  name                = format("pe-apim-gw-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.subnet_paas_spk1.id

  private_dns_zone_group {
    name = "apim-service-default"
    private_dns_zone_ids = [
      azurerm_private_dns_zone.privatelink_azure_api_net.id
    ]
  }

  private_service_connection {
    is_manual_connection           = false
    name                           = format("pe-apim-gw-%s", local.resource_suffix_kebabcase)
    private_connection_resource_id = azapi_resource.apim.id
    subresource_names              = ["Gateway"]
  }

  depends_on = [
    azapi_resource.apim
  ]
}
