resource "azurerm_subnet_network_security_group_association" "apim_spk1" {
  subnet_id                 = azurerm_subnet.subnet_apim_spk1.id
  network_security_group_id = azurerm_network_security_group.apim_spk1.id
}

resource "azurerm_network_security_group" "apim_spk1" {
  name                = format("nsg-apim-spk1-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags
}