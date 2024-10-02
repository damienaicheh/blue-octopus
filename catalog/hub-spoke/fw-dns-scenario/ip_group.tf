resource "azurerm_ip_group" "this" {
  name                = format("ipg-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name

  cidrs = [
    format("%s%s", var.vnet_dns_address_prefix, var.vnet_address_suffix),
    format("%s%s", var.vnet_spk1_address_prefix, var.vnet_address_suffix),
    format("%s%s", var.vnet_spk2_address_prefix, var.vnet_address_suffix),
    format("%s%s", var.vnet_spk3_address_prefix, var.vnet_address_suffix),
  ]

  tags = local.tags
}
