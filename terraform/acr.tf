resource "azurerm_container_registry" "this" {
  name                          = format("acr%s", local.resource_suffix_lowercase)
  resource_group_name           = azurerm_resource_group.this.name
  location                      = azurerm_resource_group.this.location
  sku                           = "Premium"
  anonymous_pull_enabled        = false
  public_network_access_enabled = false
  network_rule_bypass_option    = "AzureServices"
  tags                          = local.tags

  identity {
    type = "SystemAssigned"
  }
}