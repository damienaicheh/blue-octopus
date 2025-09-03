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