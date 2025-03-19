resource "azurerm_dev_center_network_connection" "this" {
  name                = format("con-%s", local.resource_suffix_kebabcase)
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  domain_join_type    = "AzureADJoin"
  subnet_id           = azurerm_subnet.dev_boxes.id
  tags                = local.tags
}

resource "azapi_resource" "attached_networks_eastus2" {
  type      = "Microsoft.DevCenter/devcenters/attachednetworks@2022-11-11-preview"
  name      = "EastUs2NetworkConnection"
  parent_id = azurerm_dev_center.this.id
  body = {
    properties = {
      networkConnectionId = azurerm_dev_center_network_connection.this.id
    }
  }
}