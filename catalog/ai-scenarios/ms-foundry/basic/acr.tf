resource "azurerm_container_registry" "this" {
  name                          = format("acr%s", local.resource_suffix_lowercase)
  resource_group_name           = local.resource_group_name
  location                      = local.resource_group_location
  sku                           = "Basic"
  admin_enabled                 = true
  public_network_access_enabled = true
  anonymous_pull_enabled        = false
  data_endpoint_enabled         = false
  tags                          = local.tags

  identity {
    type = "SystemAssigned"
  }
}

resource "azapi_resource" "conn_acr" {
  type                      = "Microsoft.CognitiveServices/accounts/projects/connections@2025-06-01"
  name                      = azurerm_container_registry.this.name
  parent_id                 = azapi_resource.ms_foundry_project.id
  schema_validation_enabled = false

  body = {
    properties = {
      category = "ContainerRegistry"
      target   = azurerm_container_registry.this.id
      authType = "AAD"
      metadata = {
        ApiType    = "Azure"
        ResourceId = azurerm_container_registry.this.id
        location   = local.resource_group_location
      }
    }
  }

  depends_on = [
    azapi_resource.ms_foundry_project
  ]
}