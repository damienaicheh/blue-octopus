resource "azurerm_route_table" "spk_eus2" {
  name                          = format("rt-spk-to-hub-routes-%s", var.region)
  location                      = local.resource_group_location
  resource_group_name           = local.resource_group_name
  bgp_route_propagation_enabled = true
  tags                          = local.tags
}

resource "azurerm_route" "spk_eus2_rt_to_spk1" {
  name                = "rt-to-spk1"
  resource_group_name = local.resource_group_name
  route_table_name    = azurerm_route_table.spk_eus2.name
  address_prefix      = format("%s%s", var.vnet_spk1_address_prefix, var.vnet_address_suffix)
  next_hop_type       = "VirtualNetworkGateway"
}

resource "azurerm_route" "spk_eus2_rt_to_spk2" {
  name                = "rt-to-spk2"
  resource_group_name = local.resource_group_name
  route_table_name    = azurerm_route_table.spk_eus2.name
  address_prefix      = format("%s%s", var.vnet_spk2_address_prefix, var.vnet_address_suffix)
  next_hop_type       = "VirtualNetworkGateway"
}

resource "azurerm_route" "spk_eus2_rt_to_spk3" {
  name                = "rt-to-spk3"
  resource_group_name = local.resource_group_name
  route_table_name    = azurerm_route_table.spk_eus2.name
  address_prefix      = format("%s%s", var.vnet_spk3_address_prefix, var.vnet_address_suffix)
  next_hop_type       = "VirtualNetworkGateway"
}

resource "azurerm_subnet_route_table_association" "spk_eus2_paas_spk1" {
  subnet_id      = azurerm_subnet.subnet_paas_spk1.id
  route_table_id = azurerm_route_table.spk_eus2.id
}

resource "azurerm_subnet_route_table_association" "spk_eus2_paas_spk2" {
  subnet_id      = azurerm_subnet.subnet_paas_spk2.id
  route_table_id = azurerm_route_table.spk_eus2.id
}

resource "azurerm_route_table" "spk_swc" {
  name                          = format("rt-spk-to-hub-routes-%s", var.region_spk3)
  location                      = var.location_spk3
  resource_group_name           = local.resource_group_name
  bgp_route_propagation_enabled = true
  tags                          = local.tags
}

resource "azurerm_route" "spk_swc_rt_to_spk3" {
  name                = "rt-to-spk1"
  resource_group_name = local.resource_group_name
  route_table_name    = azurerm_route_table.spk_swc.name
  address_prefix      = format("%s%s", var.vnet_spk1_address_prefix, var.vnet_address_suffix)
  next_hop_type       = "VirtualNetworkGateway"
}

resource "azurerm_route" "spk_swc_rt_to_spk2" {
  name                = "rt-to-spk2"
  resource_group_name = local.resource_group_name
  route_table_name    = azurerm_route_table.spk_swc.name
  address_prefix      = format("%s%s", var.vnet_spk2_address_prefix, var.vnet_address_suffix)
  next_hop_type       = "VirtualNetworkGateway"
}

resource "azurerm_subnet_route_table_association" "spk_swc_paas_spk3" {
  subnet_id      = azurerm_subnet.subnet_paas_spk3.id
  route_table_id = azurerm_route_table.spk_swc.id
}