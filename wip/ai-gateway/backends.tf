resource "azapi_resource" "openai_backend" {
  for_each  = { for instance in local.open_ai_resources : instance.name => instance }
  type      = "Microsoft.ApiManagement/service/backends@2024-06-01-preview"
  name      = local.backend_id
  parent_id = azapi_resource.apim.id
  body = {
    properties = {
      url      = "${azurerm_cognitive_account.open_ai[each.key].endpoint}openai"
      protocol = "http"
      circuitBreaker = {
        rules = [
          {
            # acceptRetryAfter = bool
            failureCondition = {
              count = 3
              errorReasons = [
                "Server errors"
              ]
              interval = "PT5M"
              #   percentage = int
              statusCodeRanges = [
                {
                  max = 429
                  min = 429
                }
              ]
            }
            name         = "openAIBreakerRule"
            tripDuration = "PT1M"
          }
        ]
      }
    }
  }
}

# resource "azapi_resource" "openai_backend_pool" {
#   for_each  = { for instance in local.open_ai_resources : instance.name => instance }
#   type      = "Microsoft.ApiManagement/service/backends@2024-06-01-preview"
#   name      = "openai-backend-pool"
#   parent_id = azapi_resource.apim.id
#   body = {
#     type = "Pool"
#     properties = {
#       description = "Load balancer for multiple OpenAI endpoints"
#       pool = {
#         services = [
#           {
#             id = "/backends/${azurerm_cognitive_account.open_ai[each.key].name}'"
#           }
#         ]
#       }
#     }
#   }
# }
