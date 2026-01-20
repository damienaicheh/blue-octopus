resource "azurerm_private_endpoint" "sto_blob" {
  location            = local.resource_group_location
  name                = format("pe-sto-blob-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.subnet_paas.id

  private_dns_zone_group {
    name                 = "blob-default"
    private_dns_zone_ids = [azurerm_private_dns_zone.privatelink_blob_core_windows_net.id]
  }

  private_service_connection {
    is_manual_connection           = false
    name                           = format("psc-sto-blob-%s", local.resource_suffix_kebabcase)
    private_connection_resource_id = azurerm_storage_account.this.id
    subresource_names              = ["blob"]
  }
}

resource "azurerm_private_endpoint" "sto_file" {
  location            = local.resource_group_location
  name                = format("pe-sto-file-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.subnet_paas.id

  private_dns_zone_group {
    name                 = "file-default"
    private_dns_zone_ids = [azurerm_private_dns_zone.privatelink_file_core_windows_net.id]
  }

  private_service_connection {
    is_manual_connection           = false
    name                           = format("psc-sto-file-%s", local.resource_suffix_kebabcase)
    private_connection_resource_id = azurerm_storage_account.this.id
    subresource_names              = ["file"]
  }
}

resource "azurerm_private_endpoint" "cosmos_db" {

  name                = format("pe-cosmos-db-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.subnet_paas.id

  private_dns_zone_group {
    name = "cosmos-db"
    private_dns_zone_ids = [
      azurerm_private_dns_zone.privatelink_documents_azure_com.id
    ]
  }

  private_service_connection {
    name                           = format("psc-%s", azurerm_cosmosdb_account.this.name)
    private_connection_resource_id = azurerm_cosmosdb_account.this.id
    subresource_names = [
      "Sql"
    ]
    is_manual_connection = false
  }
}

resource "azurerm_private_endpoint" "ai_search" {
  name                = format("pe-ais-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.subnet_paas.id

  private_dns_zone_group {
    name = "ai-search"
    private_dns_zone_ids = [
      azurerm_private_dns_zone.privatelink_search_windows_net.id
    ]
  }

  private_service_connection {
    name                           = format("psc-%s", azapi_resource.ai_search.name)
    private_connection_resource_id = azapi_resource.ai_search.id
    subresource_names = [
      "searchService"
    ]
    is_manual_connection = false
  }
}


resource "azurerm_private_endpoint" "ms_foundry" {
  name                = format("pe-aif-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.subnet_paas.id

  private_dns_zone_group {
    name = format("psc-%s", azapi_resource.ms_foundry.name)
    private_dns_zone_ids = [
      azurerm_private_dns_zone.privatelink_cognitiveservices_azure_com.id,
      azurerm_private_dns_zone.privatelink_services_ai_azure_com.id,
      azurerm_private_dns_zone.privatelink_openai_azure_com.id
    ]
  }

  private_service_connection {
    name                           = format("psc-%s", azapi_resource.ms_foundry.name)
    private_connection_resource_id = azapi_resource.ms_foundry.id
    subresource_names = [
      "account"
    ]
    is_manual_connection = false
  }
}
