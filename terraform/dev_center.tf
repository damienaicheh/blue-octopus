resource "azapi_resource" "dev_center" {
  type      = "Microsoft.DevCenter/devcenters@2025-02-01"
  parent_id = azurerm_resource_group.this.id
  name      = format("dvc-%s", local.resource_suffix_kebabcase)
  location  = azurerm_resource_group.this.location
  tags      = local.tags
  body = {
    properties = {
      devBoxProvisioningSettings = {
        installAzureMonitorAgentEnableStatus = "Enabled"
      }
      displayName = "Contoso Dev Center"
      networkSettings = {
        # Indicates whether pools in this Dev Center can use Microsoft Hosted Networks.
        microsoftHostedNetworkEnableStatus = "Enabled"
      }
      projectCatalogSettings = {
        # Whether project catalogs associated with projects in this dev center can be configured to sync catalog items.
        catalogItemSyncEnableStatus = "Enabled"
      }
    }
    identity = {
      type = "SystemAssigned"
    }
  }
  response_export_values = ["*"]
}

resource "azurerm_dev_center_gallery" "this" {
  dev_center_id     = local.reformat_dev_center_id
  shared_gallery_id = azurerm_shared_image_gallery.this.id
  name              = format("dvcgal%s", local.resource_suffix_lowercase)

  depends_on = [
    azurerm_role_assignment.dev_center_subscription_contributor
  ]
}

resource "azurerm_dev_center_environment_type" "this" {
  for_each      = toset(local.env_types)
  name          = each.key
  dev_center_id = local.reformat_dev_center_id

  tags = local.tags
}
