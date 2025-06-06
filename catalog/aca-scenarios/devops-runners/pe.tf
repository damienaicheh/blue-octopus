resource "azurerm_private_endpoint" "acr" {
  location            = local.resource_group_location
  name                = format("pe-acr-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.subnet_paas.id

  private_dns_zone_group {
    name                 = "acr-default"
    private_dns_zone_ids = [azurerm_private_dns_zone.container_registry.id]
  }

  private_service_connection {
    is_manual_connection           = false
    name                           = format("pe-acr-%s", local.resource_suffix_kebabcase)
    private_connection_resource_id = azurerm_container_registry.this.id
    subresource_names              = ["registry"]
  }

  depends_on = [
    azurerm_container_registry.this,
    # null_resource.acr_docker_build_push
  ]
}

resource "azurerm_private_endpoint" "app_service" {
  name                = format("pe-app-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.subnet_paas.id

  private_dns_zone_group {
    name                 = "app-service-default"
    private_dns_zone_ids = [azurerm_private_dns_zone.web.id]
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