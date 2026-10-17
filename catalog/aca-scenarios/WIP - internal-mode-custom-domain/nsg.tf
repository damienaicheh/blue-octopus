resource "azurerm_subnet_network_security_group_association" "appgw" {
  subnet_id                 = azurerm_subnet.subnet_appgw.id
  network_security_group_id = azurerm_network_security_group.appgw.id
}

resource "azurerm_network_security_group" "appgw" {
  name                = format("nsg-appgw-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name

  security_rule {
    name                       = "AppGwInbound"
    description                = "AppGw inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "65200-65535"
    source_address_prefix      = "GatewayManager"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AppGwInboundInternet"
    description                = "AppGw inbound Internet"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow_HTTP"
    description                = "Allow http incoming connections"
    protocol                   = "*"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_ranges    = ["80"]
    access                     = "Allow"
    priority                   = 120
    direction                  = "Inbound"
  }

  security_rule {
    name                       = "Allow_AzureLoadBalancer"
    description                = "Allow AzureLoadBalancer incoming connections"
    protocol                   = "*"
    source_address_prefix      = "AzureLoadBalancer"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_ranges    = ["80"]
    access                     = "Allow"
    priority                   = 130
    direction                  = "Inbound"
  }

  tags = local.tags
}
