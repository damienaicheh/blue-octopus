resource "azurerm_api_management_product" "free" {
  product_id            = "free"
  api_management_name   = azurerm_api_management.apim_dev.name
  resource_group_name   = local.resource_group_name
  display_name          = "Free"
  subscription_required = true
  approval_required     = false
  published             = true
}

resource "azurerm_api_management_product" "free_prod" {
  product_id            = "free"
  api_management_name   = azurerm_api_management.apim_prod.name
  resource_group_name   = local.resource_group_name
  display_name          = "Free"
  subscription_required = true
  approval_required     = false
  published             = true
}

resource "azurerm_api_management_product" "premium_prod" {
  product_id            = "premium"
  api_management_name   = azurerm_api_management.apim_prod.name
  resource_group_name   = local.resource_group_name
  display_name          = "Premium"
  subscription_required = true
  approval_required     = false
  published             = true
}

resource "azurerm_api_management_product_api" "free_prod_colors" {
  product_id          = azurerm_api_management_product.free_prod.product_id
  api_name            = azurerm_api_management_api.colors_prod.name
  api_management_name = azurerm_api_management.apim_prod.name
  resource_group_name = local.resource_group_name
}

resource "azurerm_api_management_product_api" "premium_prod_pets" {
  product_id          = azurerm_api_management_product.premium_prod.product_id
  api_name            = azurerm_api_management_api.pets_prod.name
  api_management_name = azurerm_api_management.apim_prod.name
  resource_group_name = local.resource_group_name
}

resource "azurerm_api_management_product_api" "premium_prod_colors" {
  product_id          = azurerm_api_management_product.premium_prod.product_id
  api_name            = azurerm_api_management_api.colors_prod.name
  api_management_name = azurerm_api_management.apim_prod.name
  resource_group_name = local.resource_group_name
}
resource "azurerm_api_management_product_group" "free_prod" {
  for_each            = toset(["administrators", "developers", "guests"])
  product_id          = azurerm_api_management_product.free_prod.product_id
  group_name          = each.value
  api_management_name = azurerm_api_management.apim_prod.name
  resource_group_name = local.resource_group_name
}

resource "azurerm_api_management_product_group" "premium_prod" {
  for_each            = toset(["administrators", "developers", "guests"])
  product_id          = azurerm_api_management_product.premium_prod.product_id
  group_name          = each.value
  api_management_name = azurerm_api_management.apim_prod.name
  resource_group_name = local.resource_group_name
}
