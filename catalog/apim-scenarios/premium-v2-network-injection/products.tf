resource "azurerm_api_management_product" "ms_foundry" {
  product_id            = format("%s-%s", azapi_resource.ms_foundry.name, azapi_resource.ms_foundry_project.name)
  api_management_name   = azurerm_api_management.this.name
  resource_group_name   = local.resource_group_name
  display_name          = format("%s - %s", azapi_resource.ms_foundry.name, azapi_resource.ms_foundry_project.name)
  description           = format("Product for Foundry API %s", azapi_resource.ms_foundry.name)
  subscription_required = true
  approval_required     = false
  published             = true

  depends_on = [
    azurerm_api_management_api.ms_foundry,
  ]
}

resource "azurerm_api_management_product_api" "ms_foundry" {
  product_id          = azurerm_api_management_product.ms_foundry.product_id
  api_name            = azurerm_api_management_api.ms_foundry.name
  api_management_name = azurerm_api_management.this.name
  resource_group_name = local.resource_group_name
}