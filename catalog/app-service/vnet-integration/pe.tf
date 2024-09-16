resource "azurerm_private_endpoint" "this" {
  name                = format("pe-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.paas_subnet.id
  tags                = local.tags

  private_service_connection {
    name                           = format("psc-%s", local.resource_suffix_kebabcase)
    private_connection_resource_id = azurerm_linux_web_app.this.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}
