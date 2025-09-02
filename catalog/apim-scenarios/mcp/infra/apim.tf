resource "azapi_resource" "apim_dev" {
  type      = "Microsoft.ApiManagement/service@2024-05-01"
  name      = format("apim-%s", local.resource_suffix_kebabcase)
  location  = local.resource_group_location
  parent_id = local.resource_group_id
  tags      = local.tags

  body = {
    properties = {
      publicNetworkAccess   = "Enabled"
      publisherName         = "Me"
      publisherEmail        = "admin@me.io"
      developerPortalStatus = "Enabled"
    }
    sku = {
      capacity = 1
      name     = "BasicV2"
    }
    identity = {
      type = "SystemAssigned"
    }
  }
  response_export_values = ["properties.gatewayUrl"]
}

resource "azapi_resource" "apim_prod" {
  type      = "Microsoft.ApiManagement/service@2024-05-01"
  name      = replace(format("apim-%s", local.resource_suffix_kebabcase), var.environment, "prd")
  location  = local.resource_group_location
  parent_id = local.resource_group_id
  tags      = local.tags

  body = {
    properties = {
      publicNetworkAccess   = "Enabled"
      publisherName         = "Me"
      publisherEmail        = "admin@me.io"
      developerPortalStatus = "Enabled"
    }
    sku = {
      capacity = 1
      name     = "BasicV2"
    }
    identity = {
      type = "SystemAssigned"
    }
  }
  response_export_values = ["properties.gatewayUrl"]
}

resource "azurerm_api_management_logger" "this" {
  name                = format("apim-logger-%s", local.resource_suffix_kebabcase)
  api_management_name = azapi_resource.apim_prod.name
  resource_group_name = local.resource_group_name
  resource_id         = azurerm_application_insights.this.id
  buffered            = false

  application_insights {
    instrumentation_key = azurerm_application_insights.this.instrumentation_key
  }

  depends_on = [
    azurerm_application_insights.this,
    azapi_resource.apim_prod
  ]
}
