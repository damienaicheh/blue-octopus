resource "azurerm_subnet_network_security_group_association" "apim_spk1" {
  subnet_id                 = azurerm_subnet.subnet_apim_spk1.id
  network_security_group_id = azurerm_network_security_group.apim_spk1.id
}

resource "azurerm_network_security_group" "apim_spk1" {
  name                = format("nsg-apim-spk1-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags

  security_rule {
    name                       = "ApimManagement"
    description                = "APIM inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3443"
    source_address_prefix      = "ApiManagement"
    destination_address_prefix = "VirtualNetwork"
  }

  security_rule {
    name                       = "AllowAppGatewayToApim"
    description                = "Allows inbound App Gateway traffic to APIM"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = format("%s%s", var.vnet_spk1_address_prefix, var.apim_subnet_address_suffix)
    destination_address_prefix = format("%s%s", var.vnet_spk1_address_prefix, var.appgw_subnet_address_suffix)
  }

  security_rule {
    name                       = "AllowAzureLoadBalancer"
    description                = "Allows inbound Azure Infrastructure Load Balancer traffic to APIM"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "6390"
    source_address_prefix      = "AzureLoadBalancer"
    destination_address_prefix = format("%s%s", var.vnet_spk1_address_prefix, var.appgw_subnet_address_suffix)
  }

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


  security_rule {
    name                       = "AllowSqlEndpoint"
    description                = "Allows outbound traffic to SQL Endpoint"
    priority                   = 120
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1433"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "SQL"
  }

  security_rule {
    name                       = "AllowAzureMonitor"
    description                = "Allows outbound traffic to Azure Monitor"
    priority                   = 130
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1886"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "AzureMonitor"
  }

  security_rule {
    name                       = "AllowAzureMonitorHTTPS"
    description                = "Allows outbound traffic to Azure Monitor"
    priority                   = 131
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "AzureMonitor"
  }

  depends_on = [
    azurerm_subnet.subnet_apim_spk1
  ]
}

resource "azurerm_subnet_network_security_group_association" "shared_workspace_gateway_spk1" {
  subnet_id                 = azurerm_subnet.subnet_shared_workspace_gateway_spk1.id
  network_security_group_id = azurerm_network_security_group.shared_workspace_gateway_spk1.id
}

resource "azurerm_network_security_group" "shared_workspace_gateway_spk1" {
  name                = format("nsg-shd-wg-1-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags

  security_rule {
    name                       = "AllowSharedWorkspaceGatewayInternalHealthPing"
    description                = "Allow internal health ping traffic"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "AzureLoadBalancer"
    destination_address_prefix = format("%s%s", var.vnet_spk1_address_prefix, var.apim_shared_workspace_gateway_subnet_address_suffix)
  }

  security_rule {
    name                       = "AllowSharedWorkspaceGatewayTrafficHttp"
    description                = "Allow inbound traffic"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = format("%s%s", var.vnet_spk1_address_prefix, var.apim_shared_workspace_gateway_subnet_address_suffix)
  }

  security_rule {
    name                       = "AllowSharedWorkspaceGatewayTrafficHttps"
    description                = "Allow inbound traffic"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = format("%s%s", var.vnet_spk1_address_prefix, var.apim_shared_workspace_gateway_subnet_address_suffix)
  }
}


resource "azurerm_subnet_network_security_group_association" "dedicated_workspace_gateway_spk1" {
  subnet_id                 = azurerm_subnet.subnet_dedicated_workspace_gateway_spk1.id
  network_security_group_id = azurerm_network_security_group.dedicated_workspace_gateway_spk1.id
}

resource "azurerm_network_security_group" "dedicated_workspace_gateway_spk1" {
  name                = format("nsg-dwg-wkp-3-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags

  security_rule {
    name                       = "AllowDedicatedWorkspaceGatewayInternalHealthPing"
    description                = "Allow internal health ping traffic"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "AzureLoadBalancer"
    destination_address_prefix = format("%s%s", var.vnet_spk1_address_prefix, var.apim_dedicated_workspace_gateway_subnet_address_suffix)
  }

  security_rule {
    name                       = "AllowDedicatedWorkspaceGatewayTrafficHttp"
    description                = "Allow inbound traffic"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = format("%s%s", var.vnet_spk1_address_prefix, var.apim_dedicated_workspace_gateway_subnet_address_suffix)
  }

  security_rule {
    name                       = "AllowDedicatedWorkspaceGatewayTrafficHttps"
    description                = "Allow inbound traffic"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = format("%s%s", var.vnet_spk1_address_prefix, var.apim_dedicated_workspace_gateway_subnet_address_suffix)
  }
}
