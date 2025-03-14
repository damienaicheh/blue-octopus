resource "azapi_resource" "api_policy" {
  type      = "Microsoft.ApiManagement/service/apis/policies@2024-06-01-preview"
  name      = "policy"
  parent_id = azapi_resource.openai_api.id
  body = {
    properties = {
      format = "xml"
      value  = data.template_file.policy.rendered
    }
  }

  depends_on = [
    azapi_resource.openai_backend_pool
  ]
  schema_validation_enabled = false
}
