resource "azurerm_api_management_subscription" "ms_foundry" {
  product_id          = azurerm_api_management_product.ms_foundry.id
  api_management_name = azurerm_api_management.this.name
  resource_group_name = local.resource_group_name
  display_name        = format("%s -%s", azapi_resource.ms_foundry.name, azapi_resource.ms_foundry_project.name)
  state               = "active"
  allow_tracing       = false

  depends_on = [
    azurerm_api_management_product_api.ms_foundry,
  ]
}
