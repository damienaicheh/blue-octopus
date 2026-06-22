resource "azurerm_api_management" "this" {
  name                 = format("apim-%s", local.resource_suffix_kebabcase)
  location             = local.resource_group_location
  resource_group_name  = local.resource_group_name
  publisher_name       = "Me"
  publisher_email      = "me@example.com"
  virtual_network_type = "Internal"

  sku_name                      = "PremiumV2_1"
  public_network_access_enabled = true
  tags                          = local.tags

  identity {
    type = "SystemAssigned"
  }

  virtual_network_configuration {
    subnet_id = azurerm_subnet.subnet_apim.id
  }

  lifecycle {
    ignore_changes = [
      public_network_access_enabled,
    ]
  }

  depends_on = [
    azurerm_private_dns_zone.privatelink_azure_api_net,
    azurerm_network_security_group.apim
  ]
}

resource "azapi_update_resource" "apim_disable_network_access" {
  type        = "Microsoft.ApiManagement/service@2024-05-01"
  resource_id = azurerm_api_management.this.id

  body = {
    properties = {
      publicNetworkAccess = "Disabled"
    }
  }

  depends_on = [
    azurerm_private_endpoint.apim_gateway,
  ]
}