# resource "azurerm_dev_center_catalog" "pre_defined_catalogs" {
#   name                = "blue-octopus"
#   resource_group_name = azurerm_resource_group.this.name
#   dev_center_id       = azurerm_dev_center.this.id
#   catalog_github {
#     branch            = "main"
#     path              = "/catalog"
#     uri               = "https://github.com/damienaicheh/blue-octopus.git"
#     key_vault_key_url = "https://${azurerm_key_vault.this.name}.vault.azure.net/secrets/Pat"
#   }
# }

# resource "azurerm_dev_center_catalog" "environment_catalogs" {
#   for_each            = var.environment_catalogs
#   name                = each.value.name
#   resource_group_name = azurerm_resource_group.this.name
#   dev_center_id       = azurerm_dev_center.this.id
#   catalog_github {
#     branch            = each.value.branch
#     path              = each.value.path
#     uri               = each.value.uri
#     key_vault_key_url = "https://${azurerm_key_vault.this.name}.vault.azure.net/secrets/Pat"
#   }
# }

resource "azapi_resource" "eshop_catalog_image_definitions" {
  parent_id = azapi_resource.projects["eshop"].id
  type = "Microsoft.DevCenter/projects/catalogs@2025-02-01"
  name = "image-definitions"
  body = {
    properties = {
      gitHub = {
        branch = "main"
        path = ".devcenter/dev-box/image-definitions/eshop"
        secretIdentifier = "https://${azurerm_key_vault.this.name}.vault.azure.net/secrets/Pat"
        uri = "https://github.com/damienaicheh/blue-octopus.git"
      }
      syncType = "Scheduled"
      tags = local.tags
    }
  }
}