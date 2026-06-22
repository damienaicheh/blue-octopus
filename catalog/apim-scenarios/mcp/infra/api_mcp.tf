resource "azapi_resource" "github_api_mcp" {
  type      = "Microsoft.ApiManagement/service/apis@2024-06-01-preview"
  name      = "github"
  parent_id = azapi_resource.apim_dev.id
  body = {
    properties = {
      displayName          = "GitHub MCP"
      apiRevision          = "1"
      subscriptionRequired = false
      path                 = "api-github"
      protocols            = ["https"]
      backendId            = element(split("/", azapi_resource.github_mcp_backend.id), -1) # Get the last item to retrieve the name
      mcpProperties = {
        transportType = "streamable"
      }
      authenticationSettings = {
        openidAuthenticationSettings = []
        oAuth2AuthenticationSettings = []
      }
      subscriptionKeyParameterNames = {
        header = "Ocp-Apim-Subscription-Key"
        query  = "subscription-key"
      }
      type      = "mcp"
      isCurrent = true
    }
  }

  schema_validation_enabled = false
}

resource "azapi_resource" "ms_learn_api_mcp" {
  type      = "Microsoft.ApiManagement/service/apis@2024-06-01-preview"
  name      = "mslearn"
  parent_id = azapi_resource.apim_dev.id
  body = {
    properties = {
      displayName          = "Ms Learn MCP"
      apiRevision          = "1"
      subscriptionRequired = false
      path                 = "api-mslearn"
      protocols            = ["https"]
      backendId            = element(split("/", azapi_resource.ms_learn_mcp_backend.id), -1) # Get the last item to retrieve the name
      mcpProperties = {
        transportType = "streamable"
      }
      authenticationSettings = {
        openidAuthenticationSettings = []
        oAuth2AuthenticationSettings = []
      }
      subscriptionKeyParameterNames = {
        header = "Ocp-Apim-Subscription-Key"
        query  = "subscription-key"
      }
      type      = "mcp"
      isCurrent = true
    }
  }

  schema_validation_enabled = false
}

resource "azapi_resource" "colors_api_to_mcp" {
  type      = "Microsoft.ApiManagement/service/apis@2025-09-01-preview"
  name      = "colors-api-to-mcp"
  parent_id = azapi_resource.apim_dev.id
  body = {
    properties = {
      displayName          = "Colors API to MCP"
      apiRevision          = "1"
      subscriptionRequired = false
      path                 = "colors-api-mcp"
      protocols            = ["https"]
      backendId            = element(split("/", azapi_resource.colors_mcp_backend.id), -1)
      mcpProperties = {
        transportType = "streamable"
      }
      authenticationSettings = {
        openidAuthenticationSettings = []
        oAuth2AuthenticationSettings = []
      }
      subscriptionKeyParameterNames = {
        header = "Ocp-Apim-Subscription-Key"
        query  = "subscription-key"
      }
      type      = "mcp"
      isCurrent = true
    }
  }

  depends_on = [
    azapi_resource.apim_dev,
    azapi_resource.colors_mcp_backend
  ]

  schema_validation_enabled = false
}

resource "azapi_resource" "mcp_tool_get_color_by_id_operation" {
  type      = "Microsoft.ApiManagement/service/apis/tools@2025-09-01-preview"
  name      = "getColorById"
  parent_id = azapi_resource.colors_api_to_mcp.id
  body = {
    properties = {
      description = "Returns color specified by {colorId} (must be between 1 and 1000)."
      displayName = "getColorById"
      operationId = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${local.resource_group_name}/providers/Microsoft.ApiManagement/service/${azapi_resource.apim_dev.name}/apis/${azurerm_api_management_api.colors_dev.name}/operations/GetColorById"
    }
  }

  schema_validation_enabled = false
}

resource "azapi_resource" "mcp_tool_get_color_by_name_operation" {
  type      = "Microsoft.ApiManagement/service/apis/tools@2025-09-01-preview"
  name      = "getColorByName"
  parent_id = azapi_resource.colors_api_to_mcp.id
  body = {
    properties = {
      description = "Returns color specified by {colorName}."
      displayName = "getColorByName"
      operationId = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${local.resource_group_name}/providers/Microsoft.ApiManagement/service/${azapi_resource.apim_dev.name}/apis/${azurerm_api_management_api.colors_dev.name}/operations/GetColorByName"
    }
  }

  schema_validation_enabled = false
}

resource "azapi_resource" "mcp_tool_get_colors_operation" {
  type      = "Microsoft.ApiManagement/service/apis/tools@2025-09-01-preview"
  name      = "getColors"
  parent_id = azapi_resource.colors_api_to_mcp.id
  body = {
    properties = {
      description = "Returns all colors."
      displayName = "getColors"
      operationId = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${local.resource_group_name}/providers/Microsoft.ApiManagement/service/${azapi_resource.apim_dev.name}/apis/${azurerm_api_management_api.colors_dev.name}/operations/GetColors"
    }
  }

  schema_validation_enabled = false
}

# resource "azapi_resource" "pets_api_mcp" {
#   type      = "Microsoft.ApiManagement/service/apis@2024-06-01-preview"
#   name      = format("%s/pets-mcp-api", azapi_resource.apim_dev.name)
#   parent_id = azapi_resource.apim_dev.id
#   body = {
#     properties = {
#       displayName          = "Pets MCP"
#       apiRevision          = "1"
#       subscriptionRequired = false
#       path                 = "api-pets-mcp"
#       protocols            = ["https"]
#       authenticationSettings = {
#         openidAuthenticationSettings = []
#         oAuth2AuthenticationSettings = []
#       }
#       subscriptionKeyParameterNames = {
#         header = "Ocp-Apim-Subscription-Key"
#         query  = "subscription-key"
#       }
#       type      = "mcp"
#       isCurrent = true
#     }
#   }

#   depends_on = [
#     azapi_resource.apim_dev,
#     azapi_resource.github_mcp_backend
#   ]
# }
