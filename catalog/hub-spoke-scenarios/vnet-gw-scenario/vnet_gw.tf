resource "azurerm_virtual_network_gateway" "this" {
  name                = format("vgw-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = true
  sku           = "VpnGw1AZ"

  ip_configuration {
    name                 = "ipconfig"
    public_ip_address_id = azurerm_public_ip.vnet_gateway.id
    subnet_id            = azurerm_subnet.subnet_gateway.id
  }
}
