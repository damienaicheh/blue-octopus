resource "azurerm_cognitive_account" "open_ai" {
  name                          = format("oai-%s", local.resource_suffix_kebabcase)
  location                      = local.resource_group_location
  resource_group_name           = local.resource_group_name
  kind                          = "OpenAI"
  sku_name                      = "S0"
  public_network_access_enabled = true
  custom_subdomain_name         = format("oai-%s", local.resource_suffix_kebabcase)
}

resource "azurerm_cognitive_deployment" "chat_model" {
  name                 = "gpt-4o"
  cognitive_account_id = azurerm_cognitive_account.open_ai.id
  model {
    format  = "OpenAI"
    name    = "gpt-4o"
    version = "2024-11-20"
  }

  sku {
    name     = "GlobalStandard"
    capacity = 20
  }
}

# resource "azapi_resource" "ai_services_connection_open_ai" {
#   type      = "Microsoft.MachineLearningServices/workspaces/connections@2024-10-01"
#   name      = format("con-%s", local.resource_suffix_kebabcase)
#   parent_id = azapi_resource.hub.id

#   body = {
#     properties = {
#       category      = "AzureOpenAI",
#       target        = azapi_resource.ai_services_eus2.output.properties.endpoint,
#       authType      = "AAD",
#       isSharedToAll = true,
#       metadata = {
#         ApiType    = "Azure",
#         ResourceId = azapi_resource.ai_services_eus2.id
#       }
#     }
#   }
#   response_export_values = ["*"]
# }

resource "azapi_resource" "ai_services_connection_open_ai" {
  type      = "Microsoft.MachineLearningServices/workspaces/connections@2024-10-01"
  name      = format("con-%s", azurerm_cognitive_account.open_ai.name)
  parent_id = azapi_resource.project.id

  body = {
    properties = {
      category      = "AzureOpenAI",
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

# resource "azapi_resource" "ai_services_connection_open_ai" {
#   type      = "Microsoft.MachineLearningServices/workspaces/connections/deployments@2024-07-01-preview"
#   name      = format("con-%s", azurerm_cognitive_account.open_ai.name)
#   parent_id = azapi_resource.ai_services_connection_eus2.id
#   body = {
#     properties = {
#       type = "Azure.OpenAI"
#       // For remaining properties, see EndpointDeploymentResourceProperties objects
#       model = {
#         format  = "OpenAI"
#         name    = "gpt-4o"
#         # source  = azurerm_cognitive_deployment.chat_model.id
#         version = "2024-11-20"
#       }
#       # raiPolicyName = "string"
#       # sku = {
#       #   capacity = 20
#       #   # family   = "string"
#       #   name = "GlobalStandard"
#       #   # size     = "string"
#       #   # tier     = "string"
#       # }
#       versionUpgradeOption = "OnceNewDefaultVersionAvailable"
#     }
#   }
# }
