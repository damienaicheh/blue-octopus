resource "azurerm_container_registry" "this" {
  name                   = format("acr%s", local.resource_suffix_lowercase)
  resource_group_name    = azurerm_resource_group.this.name
  location               = azurerm_resource_group.this.location
  sku                    = "Standard"
  anonymous_pull_enabled = true
  tags                   = local.tags

  identity {
    type = "SystemAssigned"
  }
}