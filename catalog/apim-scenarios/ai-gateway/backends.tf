resource "azapi_resource" "openai_backend" {
  for_each  = local.open_ai_resources
  type      = "Microsoft.ApiManagement/service/backends@2024-06-01-preview"
  name      = each.value.name
  parent_id = azapi_resource.apim.id
  body = {
    properties = {
      url      = "${azurerm_cognitive_account.open_ai[each.key].endpoint}openai"
      protocol = "http"
      circuitBreaker = {
        rules = [
          {
            acceptRetryAfter = true
            failureCondition = {
              count = 3
              errorReasons = [
                "Server errors"
              ]
              interval = "PT5M"
              statusCodeRanges = [
                {
                  max = 429
                  min = 429
                }
              ]
            }
            name         = "OpenAIBreakerRule"
            tripDuration = "PT1M"
          }
        ]
      }
    }
  }

  depends_on = [
    azurerm_cognitive_account.open_ai
  ]
}
