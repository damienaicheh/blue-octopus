resource "azurerm_search_service" "this" {
  name                          = format("srch-%s", local.resource_suffix_kebabcase)
  resource_group_name           = local.resource_group_name
  location                      = local.resource_group_location
  sku                           = "standard"
  public_network_access_enabled = true
  tags                          = local.tags
}