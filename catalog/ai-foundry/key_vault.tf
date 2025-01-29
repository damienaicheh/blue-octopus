resource "azurerm_key_vault" "this" {
  name                     = format("kv-%s", local.resource_suffix_kebabcase)
  location                 = local.resource_group_location
  resource_group_name      = local.resource_group_name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  sku_name                 = "standard"
  purge_protection_enabled = false
}
