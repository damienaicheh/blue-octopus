resource "azurerm_api_management_backend" "ms_foundry_azure_ai" {
  name                = format("%s-azureai-backend", azapi_resource.ms_foundry_all_models.name)
  resource_group_name = local.resource_group_name
  api_management_name = azurerm_api_management.this.name
  description         = format("Azure AI inference backend for %s", azapi_resource.ms_foundry_all_models.name)
  protocol            = "http"
  url                 = format("%s/models", trimsuffix(azapi_resource.ms_foundry_all_models.output.properties.endpoints["Azure AI Model Inference API"], "/"))

  tls {
    validate_certificate_chain = false
    validate_certificate_name  = false
  }
}