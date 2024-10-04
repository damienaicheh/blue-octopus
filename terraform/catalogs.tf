resource "azurerm_dev_center_catalog" "dev_box_default_tasks" {
  name                = "official-tasks"
  resource_group_name = azurerm_resource_group.this.name
  dev_center_id       = azurerm_dev_center.this.id
  catalog_github {
    branch            = "main"
    path              = "/Tasks"
    uri               = "https://github.com/microsoft/devcenter-catalog.git"
    key_vault_key_url = "https://${azurerm_key_vault.this.name}.vault.azure.net/secrets/Pat"
  }
}

resource "azurerm_dev_center_catalog" "dev_box_advanced_tasks" {
  name                = "advanced-tasks"
  resource_group_name = azurerm_resource_group.this.name
  dev_center_id       = azurerm_dev_center.this.id
  catalog_github {
    branch            = "main"
    path              = "/advanced-examples"
    uri               = "https://github.com/microsoft/devcenter-examples.git"
    key_vault_key_url = "https://${azurerm_key_vault.this.name}.vault.azure.net/secrets/Pat"
  }
}

resource "azurerm_dev_center_catalog" "pre_defined_catalogs" {
  name                = "blue-octopus"
  resource_group_name = azurerm_resource_group.this.name
  dev_center_id       = azurerm_dev_center.this.id
  catalog_github {
    branch            = "main"
    path              = "/catalog"
    uri               = "https://github.com/innovation-toolbox/blue-octopus.git"
    key_vault_key_url = "https://${azurerm_key_vault.this.name}.vault.azure.net/secrets/Pat"
  }
}

resource "azurerm_dev_center_catalog" "environment_catalogs" {
  for_each            = var.environment_catalogs
  name                = each.value.name
  resource_group_name = azurerm_resource_group.this.name
  dev_center_id       = azurerm_dev_center.this.id
  catalog_github {
    branch            = each.value.branch
    path              = each.value.path
    uri               = each.value.uri
    key_vault_key_url = "https://${azurerm_key_vault.this.name}.vault.azure.net/secrets/Pat"
  }
}