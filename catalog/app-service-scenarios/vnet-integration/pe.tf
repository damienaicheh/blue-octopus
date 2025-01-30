resource "azurerm_private_endpoint" "app_service" {
  name                = format("pe-app-%s", local.resource_suffix_kebabcase)
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.app_service_subnet.id

  private_dns_zone_group {
    name = "app-service-default"
    private_dns_zone_ids = [
      azurerm_private_dns_zone.privatelink_azurewebsites_net.id
    ]
  }

  private_service_connection {
    is_manual_connection           = false
    name                           = format("pe-app-%s", local.resource_suffix_kebabcase)
    private_connection_resource_id = azurerm_linux_web_app.this.id
    subresource_names              = ["sites"]
  }

  depends_on = [
    azurerm_linux_web_app.this
  ]
}
