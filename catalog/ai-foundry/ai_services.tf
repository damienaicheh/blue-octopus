moved {
  from = azapi_resource.AIServicesResource
  to   = azapi_resource.ai_services_eus2
}

resource "azapi_resource" "ai_services_eus2" {
  type      = "Microsoft.CognitiveServices/accounts@2024-10-01"
  name      = format("ais-%s", local.resource_suffix_kebabcase)
  location  = local.resource_group_location
  parent_id = local.resource_group_id

  identity {
    type = "SystemAssigned"
  }

  body = {
    properties = {
      //restore = true
      customSubDomainName = format("ais-%s", local.resource_suffix_kebabcase)
      apiProperties = {
        statisticsEnabled = false
      }
    }
    kind = "AIServices"
    sku = {
      name = "S0"
    }
  }

  response_export_values = ["*"]
}

resource "azapi_resource" "ai_services_connection_eus2" {
  type      = "Microsoft.MachineLearningServices/workspaces/connections@2024-10-01"
  name      = format("ais-con-%s", local.resource_suffix_kebabcase)
  parent_id = azapi_resource.hub.id

  body = {
    properties = {
      category      = "AIServices",
      target        = azapi_resource.ai_services_eus2.output.properties.endpoint,
      authType      = "AAD",
      isSharedToAll = true,
      metadata = {
        ApiType    = "Azure",
        ResourceId = azapi_resource.ai_services_eus2.id
      }
    }
  }
  response_export_values = ["*"]
}
