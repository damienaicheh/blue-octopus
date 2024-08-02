resource "azurerm_dev_center_network_connection" "this" {
  name                = format("con-%s", local.resource_suffix_kebabcase)
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  domain_join_type    = "AzureADJoin"
  subnet_id           = azurerm_subnet.dev_boxes.id
  tags                = local.tags
}