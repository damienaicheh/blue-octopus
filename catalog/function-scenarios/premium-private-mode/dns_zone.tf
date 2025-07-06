resource "azurerm_private_dns_zone" "app_service" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = local.resource_group_name
}

resource "azurerm_private_dns_zone" "sto_blob" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = local.resource_group_name
}

resource "azurerm_private_dns_zone" "sto_file" {
  name                = "privatelink.file.core.windows.net"
  resource_group_name = local.resource_group_name
}

resource "azurerm_private_dns_zone" "sto_queue" {
  name                = "privatelink.queue.core.windows.net"
  resource_group_name = local.resource_group_name
}

resource "azurerm_private_dns_zone" "sto_table" {
  name                = "privatelink.table.core.windows.net"
  resource_group_name = local.resource_group_name
}
