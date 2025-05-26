resource "azapi_resource" "shared_workspace_gateway" {
  type      = "Microsoft.ApiManagement/gateways@2023-09-01-preview"
  name      = format("apim-shd-wg-1-%s", local.resource_suffix_kebabcase)
  location  = azurerm_api_management.this.location
  parent_id = local.resource_group_id
  tags      = local.tags_azapi
  body = jsonencode({
    properties = {
      backend = {
        subnet = {
          id = azurerm_subnet.subnet_shared_workspace_gateway_spk1.id
        }
      }
      configurationApi   = {}
      frontend           = {}
      virtualNetworkType = "Internal"
    }
    sku = {
      capacity = 1
      name     = "WorkspaceGatewayPremium"
    }
  })

  depends_on = [
    azurerm_api_management.this,
    azurerm_subnet_network_security_group_association.shared_workspace_gateway_spk1,
  ]

  timeouts {
    create = "10h"
    update = "10h"
  }
}

resource "azapi_resource" "workspace_1_gateway_connection" {
  type      = "Microsoft.ApiManagement/gateways/configConnections@2023-09-01-preview"
  name      = "apim-gw-wkp-1-con"
  parent_id = azapi_resource.shared_workspace_gateway.id
  body = jsonencode({
    properties = {
      sourceId = azapi_resource.workspace_1.id
    }
  })
  depends_on = [
    azapi_resource.workspace_1,
    azapi_resource.shared_workspace_gateway
  ]
}

resource "azapi_resource" "workspace_2_gateway_connection" {
  type      = "Microsoft.ApiManagement/gateways/configConnections@2023-09-01-preview"
  name      = "apim-gw-wkp-2-con"
  parent_id = azapi_resource.shared_workspace_gateway.id
  body = jsonencode({
    properties = {
      sourceId = azapi_resource.workspace_2.id
    }
  })
  depends_on = [
    azapi_resource.workspace_2,
    azapi_resource.shared_workspace_gateway
  ]
}

resource "azapi_resource" "dedicated_workspace_gateway" {
  type      = "Microsoft.ApiManagement/gateways@2023-09-01-preview"
  name      = format("apim-dwg-wkp-%s", local.resource_suffix_kebabcase)
  location  = azurerm_api_management.this.location
  parent_id = local.resource_group_id
  tags      = local.tags_azapi
  body = jsonencode({
    properties = {
      backend = {
        subnet = {
          id = azurerm_subnet.subnet_dedicated_workspace_gateway_spk1.id
        }
      }
      configurationApi   = {}
      frontend           = {}
      virtualNetworkType = "Internal"
    }
    sku = {
      capacity = 1
      name     = "WorkspaceGatewayPremium"
    }
  })

  depends_on = [
    azurerm_api_management.this,
    azurerm_subnet_network_security_group_association.dedicated_workspace_gateway_spk1
  ]

  timeouts {
    create = "10h"
    update = "10h"
  }
}

resource "azapi_resource" "workspace_3_gateway_connection" {
  type      = "Microsoft.ApiManagement/gateways/configConnections@2023-09-01-preview"
  name      = "apim-gw-wkp-3-con"
  parent_id = azapi_resource.dedicated_workspace_gateway.id
  body = jsonencode({
    properties = {
      sourceId = azapi_resource.workspace_3.id
    }
  })
  depends_on = [
    azapi_resource.workspace_3,
    azapi_resource.shared_workspace_gateway
  ]
}