resource "azurerm_load_test" "this" {
  location            = local.resource_group_location
  name                = format("lt-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name

  identity {
    type = "SystemAssigned"
  }
  tags = local.tags
}
