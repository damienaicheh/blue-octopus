resource "azurerm_private_dns_resolver" "this" {
  name                = format("dnspr-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  virtual_network_id  = azurerm_virtual_network.dns.id
  tags                = local.tags
}

resource "azurerm_private_dns_resolver_inbound_endpoint" "this" {
  name                    = format("in-%s", local.resource_suffix_kebabcase)
  private_dns_resolver_id = azurerm_private_dns_resolver.this.id
  location                = azurerm_private_dns_resolver.this.location

  ip_configurations {
    private_ip_allocation_method = "Dynamic"
    subnet_id                    = azurerm_subnet.subnet_dns_inbound.id
  }

  tags = local.tags
}

resource "azurerm_private_dns_resolver_outbound_endpoint" "this" {
  name                    = format("out-%s", local.resource_suffix_kebabcase)
  private_dns_resolver_id = azurerm_private_dns_resolver.this.id
  location                = azurerm_private_dns_resolver.this.location
  subnet_id               = azurerm_subnet.subnet_dns_outbound.id
  tags                    = local.tags
}

resource "azurerm_private_dns_resolver_dns_forwarding_ruleset" "this" {
  name                                       = format("dnsfrs-%s", local.resource_suffix_kebabcase)
  resource_group_name                        = local.resource_group_name
  location                                   = local.resource_group_location
  private_dns_resolver_outbound_endpoint_ids = [azurerm_private_dns_resolver_outbound_endpoint.this.id]
}

resource "azurerm_private_dns_resolver_virtual_network_link" "this" {
  name                      = format("link-%s", azurerm_private_dns_resolver_dns_forwarding_ruleset.this.name)
  dns_forwarding_ruleset_id = azurerm_private_dns_resolver_dns_forwarding_ruleset.this.id
  virtual_network_id        = azurerm_virtual_network.dns.id
}

resource "azurerm_private_dns_resolver_forwarding_rule" "this" {
  name                      = "azure-api-net"
  dns_forwarding_ruleset_id = azurerm_private_dns_resolver_dns_forwarding_ruleset.this.id
  domain_name               = "azure-api.net."
  enabled                   = true

  target_dns_servers {
    ip_address = azurerm_private_dns_resolver_inbound_endpoint.this.ip_configurations[0].private_ip_address
    port       = 53
  }
}
