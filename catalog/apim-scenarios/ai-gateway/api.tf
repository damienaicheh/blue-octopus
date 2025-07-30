resource "azurerm_api_management_api" "openai_api" {
  name                = "openai-api"
  resource_group_name = local.resource_group_name
  api_management_name = azapi_resource.apim.name
  revision            = "1"
  display_name        = "OpenAI"
  path                = "openai"
  protocols           = ["https"]
  api_type            = "http"
  import {
    content_format = "openapi-link"
    content_value  = "https://raw.githubusercontent.com/Azure/azure-rest-api-specs/main/specification/cognitiveservices/data-plane/AzureOpenAI/inference/stable/2024-02-01/inference.json"
  }
  subscription_key_parameter_names {
    header = "api-key"
    query  = "api-key"
  }
  subscription_required = true
}