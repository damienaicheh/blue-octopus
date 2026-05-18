resource "azurerm_subnet_network_security_group_association" "apim" {
  subnet_id                 = azurerm_subnet.subnet_apim.id
  network_security_group_id = azurerm_network_security_group.apim.id
}

resource "azurerm_network_security_group" "apim" {
  name                = format("nsg-apim-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags

  security_rule {
    name                       = "AllowKeyVault"
    description                = "Allows outbound traffic to Azure Key Vault"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "AzureLoadBalancer"
    destination_address_prefix = "AzureKeyVault"
  }

  security_rule {
    name                       = "AllowStorage"
    description                = "Allows outbound traffic to Storage"
    priority                   = 110
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "Storage"
  }
}