resource "azurerm_user_assigned_identity" "function_identity" {
  location            = local.resource_group_location
  name                = format("id-func-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  tags                = local.tags
}
