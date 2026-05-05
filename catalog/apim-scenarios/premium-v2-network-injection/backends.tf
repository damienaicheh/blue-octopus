resource "azurerm_api_management_backend" "ms_foundry" {
  name                = format("%s-backend", azapi_resource.ms_foundry.name)
  resource_group_name = local.resource_group_name
  api_management_name = azurerm_api_management.this.name
  description         = format("Backend for Foundry %s", azapi_resource.ms_foundry.name)
  protocol            = "http"
  url                 = format("https://%s.services.ai.azure.com", azapi_resource.ms_foundry.name)

  tls {
    validate_certificate_chain = false
    validate_certificate_name  = false
  }
}