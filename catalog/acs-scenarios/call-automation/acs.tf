resource "azurerm_communication_service" "this" {
  name                = format("acs-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  data_location       = "France"
  tags                = local.tags
}