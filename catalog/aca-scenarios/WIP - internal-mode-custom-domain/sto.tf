resource "azurerm_storage_account" "this" {
  name                     = format("st%s", local.resource_suffix_lowercase)
  resource_group_name      = local.resource_group_name
  location                 = local.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tags
}

resource "azurerm_storage_queue" "hello_queue" {
  name                 = "hello-queue"
  storage_account_name = azurerm_storage_account.this.name
}