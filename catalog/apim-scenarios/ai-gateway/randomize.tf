resource "random_id" "resource_group_name_suffix" {
  keepers = {
    first = data.azurerm_client_config.current.subscription_id
  }
  byte_length = 2
}

resource "random_uuid" "workbook_id" {
  keepers = {
    first = data.azurerm_client_config.current.subscription_id
  }
}