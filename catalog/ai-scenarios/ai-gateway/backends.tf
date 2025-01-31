resource "azapi_resource" "openai_backend" {
  type      = "Microsoft.ApiManagement/service/backends@2024-06-01-preview"
  name      = local.backend_id
  parent_id = azapi_resource.apim.id
  body = {
    properties = {
      url      = "${azurerm_cognitive_account.open_ai.endpoint}/openai"
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
#   type = "Microsoft.ApiManagement/service/backends@2024-06-01-preview"
#   name = "string"
#   body = {
#     properties = {
#       description = "string"
#       pool = {
#         services = [
#           {
#             id = "string"
#             priority = int
#             weight = int
#           }
#         ]
#       }
#       type = "string"
#       url = "string"
#     }
#   }
# }