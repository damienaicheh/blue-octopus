resource "azapi_resource" "openai_api" {
  type      = "Microsoft.ApiManagement/service/apis@2024-06-01-preview"
  name      = "openai-api"
  parent_id = azapi_resource.apim.id
  body = {
    properties = {
      apiRevision = "1"
      displayName = "OpenAI"
      format      = "openapi-link"
      path        = "openai"
      protocols   = ["https"]
      type        = "http"
      value       = "https://raw.githubusercontent.com/Azure/azure-rest-api-specs/main/specification/cognitiveservices/data-plane/AzureOpenAI/inference/stable/2024-02-01/inference.json"
      subscriptionKeyParameterNames = {
        header = "api-key"
        query  = "api-key"
      }
      subscriptionRequired = true
    }
  }
}