resource "azurerm_dev_center_network_connection" "this" {
  name                = format("con-%s", local.resource_suffix_kebabcase)
  resource_group_name = azurerm_resource_group.this.name
  location            = local.germany_west_central
  domain_join_type    = "AzureADJoin"
  subnet_id           = azurerm_subnet.dev_boxes.id
  tags                = local.tags
}

resource "azapi_resource" "attached_networks_germany_west_central" {
  type      = "Microsoft.DevCenter/devcenters/attachednetworks@2022-11-11-preview"
  name      = "GermanyWestCentralNetworkConnection"
  parent_id = azapi_resource.dev_center.id
  body = {
    properties = {
      networkConnectionId = azurerm_dev_center_network_connection.this.id
    }
  }
}