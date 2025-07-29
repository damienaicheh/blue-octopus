resource "azurerm_private_endpoint" "func" {
  location            = local.resource_group_location
  name                = format("pe-func-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.subnet_paas.id

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [azurerm_private_dns_zone.privatelink_azurewebsites_net.id]
  }

  private_service_connection {
    is_manual_connection           = false
    name                           = format("psc-func-%s", local.resource_suffix_kebabcase)
    private_connection_resource_id = azurerm_linux_function_app.this.id
    subresource_names              = ["sites"]
  }

  depends_on = [
    azurerm_linux_function_app.this
  ]
}

resource "azurerm_private_endpoint" "func_sto_blob" {
  location            = local.resource_group_location
  name                = format("pe-fsto-blob-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.subnet_paas.id

  private_dns_zone_group {
    name                 = "blob-default"
    private_dns_zone_ids = [azurerm_private_dns_zone.privatelink_blob_core_windows_net.id]
  }

  private_service_connection {
    is_manual_connection           = false
    name                           = format("psc-fsto-blob-%s", local.resource_suffix_kebabcase)
    private_connection_resource_id = azurerm_storage_account.host.id
    subresource_names              = ["blob"]
  }

  depends_on = [
    azurerm_storage_account.host
  ]
}

resource "azurerm_private_endpoint" "func_sto_file" {
  location            = local.resource_group_location
  name                = format("pe-fsto-file-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.subnet_paas.id

  private_dns_zone_group {
    name                 = "file-default"
    private_dns_zone_ids = [azurerm_private_dns_zone.privatelink_file_core_windows_net.id]
  }

  private_service_connection {
    is_manual_connection           = false
    name                           = format("psc-fsto-file-%s", local.resource_suffix_kebabcase)
    private_connection_resource_id = azurerm_storage_account.host.id
    subresource_names              = ["file"]
  }

  depends_on = [
    azurerm_storage_account.host
  ]
}

resource "azurerm_private_endpoint" "func_sto_queue" {
  location            = local.resource_group_location
  name                = format("pe-fsto-queue-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.subnet_paas.id

  private_dns_zone_group {
    name                 = "queue-default"
    private_dns_zone_ids = [azurerm_private_dns_zone.privatelink_queue_core_windows_net.id]
  }

  private_service_connection {
    is_manual_connection           = false
    name                           = format("pe-fsto-queue-%s", local.resource_suffix_kebabcase)
    private_connection_resource_id = azurerm_storage_account.host.id
    subresource_names              = ["queue"]
  }

  depends_on = [
    azurerm_storage_account.host
  ]
}

resource "azurerm_private_endpoint" "func_sto_table" {
  location            = local.resource_group_location
  name                = format("pe-fsto-table-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.subnet_paas.id

  private_dns_zone_group {
    name                 = "table-default"
    private_dns_zone_ids = [azurerm_private_dns_zone.privatelink_table_core_windows_net.id]
  }

  private_service_connection {
    is_manual_connection           = false
    name                           = format("pe-fsto-table-%s", local.resource_suffix_kebabcase)
    private_connection_resource_id = azurerm_storage_account.host.id
    subresource_names              = ["table"]
  }

  depends_on = [
    azurerm_storage_account.host
  ]
}

resource "azurerm_private_endpoint" "sto_queue" {
  location            = local.resource_group_location
  name                = format("pe-sto-queue-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.subnet_paas.id

  private_dns_zone_group {
    name                 = "queue-default"
    private_dns_zone_ids = [azurerm_private_dns_zone.privatelink_queue_core_windows_net.id]
  }

  private_service_connection {
    is_manual_connection           = false
    name                           = format("pe-sto-queue-%s", local.resource_suffix_kebabcase)
    private_connection_resource_id = azurerm_storage_account.storage.id
    subresource_names              = ["queue"]
  }

  depends_on = [
    azurerm_storage_account.storage,
    azurerm_storage_queue.hello_queue
  ]
}
