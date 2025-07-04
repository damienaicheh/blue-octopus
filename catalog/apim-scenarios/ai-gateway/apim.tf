resource "azapi_resource" "apim" {
  type      = "Microsoft.ApiManagement/service@2024-05-01"
  name      = format("apim-%s", local.resource_suffix_kebabcase)
  location  = local.resource_group_location
  parent_id = local.resource_group_id

  body = {
    properties = {
      publicNetworkAccess   = "Enabled"
      publisherName         = "Me"
      publisherEmail        = "admin@me.io"
      virtualNetworkType    = "None"
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
  response_export_values = ["*"]
}

resource "azurerm_api_management_logger" "this" {
  name                = format("apim-logger-%s", local.resource_suffix_kebabcase)
  api_management_name = azapi_resource.apim.name
  resource_group_name = local.resource_group_name
  resource_id         = azapi_resource.application_insights.id
  buffered            = false

  application_insights {
    instrumentation_key = azapi_resource.application_insights.output.properties.InstrumentationKey
  }

  depends_on = [
    azapi_resource.application_insights,
    azapi_resource.apim
  ]
}
