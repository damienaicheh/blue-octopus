resource "azurerm_application_gateway" "this" {
  name                = format("appgw-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  tags                = local.tags

  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  waf_configuration {
    enabled          = true
    firewall_mode    = "Prevention"
    rule_set_version = "3.2"
  }

  ssl_policy {
    policy_name = "AppGwSslPolicy20220101"
    policy_type = "Predefined"
  }

  gateway_ip_configuration {
    name      = format("appgw-ip-%s", local.resource_suffix_kebabcase)
    subnet_id = azurerm_subnet.subnet_appgw.id
  }

  frontend_port {
    name = "Http"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "AppGwPublicIp"
    public_ip_address_id = azurerm_public_ip.appgw.id
  }

  http_listener {
    name                           = local.hello_world_http_listener_name
    frontend_ip_configuration_name = "AppGwPublicIp"
    frontend_port_name             = "Http"
    protocol                       = "Http"
  }

  backend_address_pool {
    name  = local.hello_world_backend_address_pool_name
    fqdns = [split("https://", azurerm_container_app.hello_world.latest_revision_fqdn)[0]]
  }

  backend_http_settings {
    name                                = local.hello_world_backend_http_settings_name
    port                                = 443
    protocol                            = "Https"
    cookie_based_affinity               = "Disabled"
    path                                = "/hello"
    pick_host_name_from_backend_address = true
    probe_name                          = local.hello_world_probe_name
    request_timeout                     = 30
    trusted_root_certificate_names      = []
  }


  probe {
    name                                      = local.hello_world_probe_name
    protocol                                  = "Https"
    path                                      = "/"
    host                                      = azurerm_container_app.hello_world.latest_revision_fqdn
    pick_host_name_from_backend_http_settings = false
    interval                                  = 30
    timeout                                   = 30
    unhealthy_threshold                       = 3
    match {
      status_code = ["200-399"]
    }
  }

  request_routing_rule {
    name                       = local.hello_world_request_routing_rule_name
    rule_type                  = "Basic"
    priority                   = 1
    http_listener_name         = local.hello_world_http_listener_name
    backend_address_pool_name  = local.hello_world_backend_address_pool_name
    backend_http_settings_name = local.hello_world_backend_http_settings_name
  }

  depends_on = [
    azurerm_subnet_network_security_group_association.appgw
  ]
}
