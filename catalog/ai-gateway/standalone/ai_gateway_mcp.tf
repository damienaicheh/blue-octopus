resource "azapi_resource" "ai_gateway_microsoft_learn_mcp" {
  type                      = "Microsoft.ApiManagement/aigateways/workspaces/toolServers@2025-09-01-preview"
  name                      = "microsoft-learn"
  parent_id                 = "${azapi_resource.ai_gateway.id}/workspaces/default"
  schema_validation_enabled = false

  body = {
    properties = {
      displayName = "Microsoft Learn"
      description = "Search Microsoft documentation and code samples."
      type        = "mcp"
      policies = [
        {
          type           = "requestRateLimit"
          callsPerPeriod = 20
          periodSeconds  = 60
          counterKey     = ["identity"]
        }
      ]
      endpoints = [
        {
          namespace = "microsoft-learn"
          kind      = "mcp"
          mcp = {
            url       = "https://learn.microsoft.com/api/mcp"
            transport = "streamableHttp"
          }
        }
      ]
    }
  }
}