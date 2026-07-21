resource "azurerm_user_assigned_identity" "this" {
  name                = format("id-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  tags                = local.tags
}
