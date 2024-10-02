resource "azurerm_firewall" "this" {
  name                = format("afw-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"
  tags                = local.tags

  ip_configuration {
    name                 = "ipconfig1"
    subnet_id            = azurerm_subnet.subnet_firewall.id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }

  management_ip_configuration {
    name                 = "ipconfig-management"
    subnet_id            = azurerm_subnet.subnet_firewall_management.id
    public_ip_address_id = azurerm_public_ip.firewall_management.id
  }

  firewall_policy_id = azurerm_firewall_policy.this.id

  depends_on = [
    azurerm_firewall_policy.this,
    azurerm_firewall_policy_rule_collection_group.this
  ]
}

resource "azurerm_firewall_policy" "this" {
  name                = format("afwp-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  sku                 = "Standard"
  tags                = local.tags

  dns {
    proxy_enabled = true
    servers = [
      azurerm_private_dns_resolver_inbound_endpoint.this.ip_configurations[0].private_ip_address
    ]
  }
}

resource "azurerm_firewall_policy_rule_collection_group" "this" {
  name               = "hub-fw-policy-rcg"
  firewall_policy_id = azurerm_firewall_policy.this.id
  priority           = 1000

  network_rule_collection {
    name     = "spk_rule_collection"
    priority = 1000
    action   = "Allow"
    rule {
      name                  = "network_rule_all_to_all_spk"
      protocols             = ["Any"]
      source_addresses      = azurerm_ip_group.this.cidrs
      destination_addresses = azurerm_ip_group.this.cidrs
      destination_ports     = ["*"]
    }
  }

  network_rule_collection {
    name     = "AllowAzureStorage"
    priority = 1100
    action   = "Allow"
    rule {
      name                  = "network_rule_all_to_all_spk"
      protocols             = ["Any"]
      source_addresses      = azurerm_ip_group.this.cidrs
      destination_addresses = ["Storage"]
      destination_ports     = ["*"]
    }
  }

  network_rule_collection {
    name     = "AllowAzureKeyVault"
    priority = 1200
    action   = "Allow"
    rule {
      name                  = "network_rule_all_to_all_spk"
      protocols             = ["Any"]
      source_addresses      = azurerm_ip_group.this.cidrs
      destination_addresses = ["AzureKeyVault"]
      destination_ports     = ["*"]
    }
  }

  network_rule_collection {
    name     = "AllowAzureSQLDatabase"
    priority = 1300
    action   = "Allow"
    rule {
      name                  = "network_rule_all_to_all_spk"
      protocols             = ["Any"]
      source_addresses      = azurerm_ip_group.this.cidrs
      destination_addresses = ["Sql"]
      destination_ports     = ["*"]
    }
  }
}
