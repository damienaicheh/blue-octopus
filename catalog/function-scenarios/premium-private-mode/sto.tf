resource "azurerm_storage_account" "this" {
  name                             = format("stfunc%s", local.resource_suffix_lowercase)
  resource_group_name              = local.resource_group_name
  location                         = local.resource_group_location
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  tags                             = var.tags
  cross_tenant_replication_enabled = false
  allow_nested_items_to_be_public  = false
  default_to_oauth_authentication  = true
  public_network_access_enabled    = false
}
