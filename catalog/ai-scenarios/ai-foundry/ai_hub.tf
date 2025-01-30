resource "azapi_resource" "hub" {
  type      = "Microsoft.MachineLearningServices/workspaces@2024-10-01"
  name      = format("hub-%s", local.resource_suffix_kebabcase)
  location  = local.resource_group_location
  parent_id = local.resource_group_id

  identity {
    type = "SystemAssigned"
  }

  body = {
    properties = {
      description         = "This is my Azure AI hub"
      friendlyName        = "Sandbox Hub"
      storageAccount      = azurerm_storage_account.this.id
      keyVault            = azurerm_key_vault.this.id
      applicationInsights = azurerm_application_insights.this.id

      /* Optional: To enable these field, the corresponding dependent resources need to be uncommented.
      containerRegistry = azurerm_container_registry.default.id
      */

      /*Optional: To enable Customer Managed Keys, the corresponding 
      encryption = {
        status = var.encryption_status
        keyVaultProperties = {
            keyVaultArmId = azurerm_key_vault.default.id
            keyIdentifier = var.cmk_keyvault_key_uri
        }
      }
      */

    }
    kind = "Hub"
  }
}
