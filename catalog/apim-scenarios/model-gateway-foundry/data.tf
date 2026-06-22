data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "this" {
  count = var.resource_group_name != "" ? 1 : 0
  name  = var.resource_group_name
}

# data "template_file" "foundry_policy" {
#   template = file("${path.module}/assets/policies/foundry-policy.xml.tpl")
#   vars = {
#     foundry_backend_id = azurerm_api_management_backend.ms_foundry.name
#   }
# }

data "template_file" "inference_api" {
  template = file("${path.module}/assets/apis/inference-api.json")
}

data "template_file" "inference_api_global_policy" {
  template = file("${path.module}/assets/policies/inference-api-global-policy.xml.tpl")
  vars = {
    foundry_backend_name = azurerm_api_management_backend.ms_foundry_azure_ai.name
    tenant-id            = data.azurerm_client_config.current.tenant_id
  }
}


data "azapi_resource" "apim_service" {
  type        = "Microsoft.ApiManagement/service@2025-03-01-preview"
  resource_id = azurerm_api_management.this.id

  response_export_values = ["properties.privateIPAddresses"]

  timeouts {
    read = "5m"
  }

  depends_on = [
    azurerm_api_management.this,
  ]
}
