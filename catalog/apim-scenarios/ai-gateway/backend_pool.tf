resource "azapi_resource" "openai_backend_pool" {
  type      = "Microsoft.ApiManagement/service/backends@2024-06-01-preview"
  name      = local.backend_pool_name
  parent_id = azapi_resource.apim.id
  body = {
    properties = {
      type        = "Pool"
      description = "Load balancer for multiple OpenAI endpoints"
      pool = {
        services = [
          for key, instance in local.open_ai_resources : {
            id       = "/backends/${azurerm_cognitive_account.open_ai[key].name}"
            priority = instance.priority
            weight   = instance.weight
          }
        ]
      }
    }
  }
  // BCP035: protocol and url are not needed in the Pool type. This is an incorrect error.
  schema_validation_enabled = false
  depends_on = [
    azurerm_cognitive_account.open_ai,
    azapi_resource.openai_backend
  ]
}