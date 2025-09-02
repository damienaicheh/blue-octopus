# resource "azurerm_search_service" "this" {
#   name                          = format("srch-%s", local.resource_suffix_kebabcase)
#   resource_group_name           = local.resource_group_name
#   location                      = local.resource_group_location
#   sku                           = "standard"
#   public_network_access_enabled = false
#   local_authentication_enabled  = false
#   authentication_failure_mode   = "http401WithBearerChallenge"

#   identity {
#     type = "SystemAssigned"
#   }

#   replica_count              = 1
#   partition_count            = 1
#   hosting_mode               = "default"
#   network_rule_bypass_option = "None"

#   tags = local.tags
# }

resource "azapi_resource" "ai_search" {

  type      = "Microsoft.Search/searchServices@2025-05-01"
  name      = format("srch-%s", local.resource_suffix_kebabcase)
  parent_id = local.resource_group_id
  location  = local.resource_group_location

  body = {
    sku = {
      name = "standard"
    }

    identity = {
      type = "SystemAssigned"
    }

    properties = {

      # Search-specific properties
      replicaCount   = 1
      partitionCount = 1
      hostingMode    = "default"
      semanticSearch = "disabled"

      # Identity-related controls
      disableLocalAuth = false
      authOptions = {
        aadOrApiKey = {
          aadAuthFailureMode = "http401WithBearerChallenge"
        }
      }
      # Networking-related controls
      publicNetworkAccess = "Disabled"
      networkRuleSet = {
        bypass = "None"
      }
    }
  }
}

resource "azapi_resource" "conn_ai_search" {
  type                      = "Microsoft.CognitiveServices/accounts/projects/connections@2025-06-01"
  name                      = azapi_resource.ai_search.name
  parent_id                 = azapi_resource.ai_foundry_project.id
  schema_validation_enabled = false

  body = {
    name = azapi_resource.ai_search.name
    properties = {
      category = "CognitiveSearch"
      target   = "https://${azapi_resource.ai_search.name}.search.windows.net"
      authType = "AAD"
      metadata = {
        ApiType    = "Azure"
        ApiVersion = "2025-05-01-preview"
        ResourceId = azapi_resource.ai_search.id
        location   = var.location
      }
    }
  }

  response_export_values = [
    "identity.principalId"
  ]

  depends_on = [
    azapi_resource.ai_foundry_project
  ]

}
