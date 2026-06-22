resource "azurerm_api_management_product" "free" {
  product_id            = "free"
  api_management_name   = azapi_resource.apim_dev.name
  resource_group_name   = local.resource_group_name
  display_name          = "Free"
  subscription_required = true
  approval_required     = false
  published             = true
}