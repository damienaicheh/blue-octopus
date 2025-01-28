resource "azapi_resource" "apim" {
  type      = "Microsoft.ApiManagement/service@2024-05-01"
  name      = format("apim-%s", local.resource_suffix_kebabcase)
  location  = local.resource_group_location
  parent_id = local.resource_group_id

  body = {
    properties = {
      # publicIpAddressId   = azurerm_public_ip.apim.id
      publicNetworkAccess = "Enabled"
      publisherName       = "Me"
      publisherEmail      = "admin@me.io"
      virtualNetworkConfiguration = {
        subnetResourceId = azurerm_subnet.subnet_apim_spk1.id
      }
      virtualNetworkType = "External"
      developerPortalStatus = "Enabled"
    }
    sku = {
      capacity = 1
      name     = "StandardV2"
    }
    identity = {
      type = "SystemAssigned"
    }
  }
  response_export_values = ["properties.gatewayUrl"]

  depends_on = [
    azurerm_subnet.subnet_apim_spk1,
    azurerm_network_security_group.apim_spk1,
    azurerm_subnet_network_security_group_association.apim_spk1
  ]
}
