resource "azurerm_storage_account" "this" {
  name                     = format("st%s", local.resource_suffix_lowercase)
  resource_group_name      = local.resource_group_name
  location                 = local.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tags
}

resource "azurerm_storage_container" "training_files" {
  name                  = "training-files"
  storage_account_id    = azurerm_storage_account.this.id
  container_access_type = "private"
}