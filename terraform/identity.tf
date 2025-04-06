# resource "azurerm_user_assigned_identity" "projects_acr" {
#   location            = azurerm_resource_group.this.location
#   name                = format("id-prjs-%s", local.resource_suffix_kebabcase)
#   resource_group_name = azurerm_resource_group.this.name
#   tags                = local.tags
# }
