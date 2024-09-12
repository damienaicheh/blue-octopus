resource "azapi_resource" "java_dev_box_definition" {
  type      = "Microsoft.DevCenter/devcenters/devboxdefinitions@2023-04-01"
  name      = "java-stack-dev-box-definition"
  location  = azurerm_resource_group.this.location
  parent_id = azurerm_dev_center.this.id
  tags      = local.tags_azapi
  body = jsonencode({
    properties = {
      hibernateSupport = "Enabled"
      imageReference = {
        id = "${azurerm_dev_center.this.id}/galleries/default/images/microsoftvisualstudio_visualstudioplustools_vs-2022-ent-general-win11-m365-gen2"
      }
      osStorageType = "ssd_256gb"
      sku = {
        name = "general_i_8c32gb256ssd_v2"
      }
    },    
  })
}

# Wait for Hibernate to be supported
# resource "azurerm_dev_center_dev_box_definition" "java_dev_box_definition" {
#   name               = "java-stack-dev-box-definition"
#   location           = azurerm_resource_group.this.location
#   dev_center_id      = azurerm_dev_center.this.id
#   image_reference_id = "${azurerm_dev_center.this.id}/galleries/default/images/microsoftvisualstudio_visualstudioplustools_vs-2022-ent-general-win11-m365-gen2"
#   sku_name           = "general_i_8c32gb256ssd_v2"
#   tags               = local.tags
# }

resource "azapi_resource" "dotnet_dev_box_definition" {
  type      = "Microsoft.DevCenter/devcenters/devboxdefinitions@2023-04-01"
  name      = "dotnet-stack-dev-box-definition"
  location  = azurerm_resource_group.this.location
  parent_id = azurerm_dev_center.this.id
  tags      = local.tags_azapi
  body = jsonencode({
    properties = {
      hibernateSupport = "Enabled"
      imageReference = {
        id = "${azurerm_dev_center.this.id}/galleries/default/images/microsoftvisualstudio_visualstudioplustools_vs-2022-ent-general-win11-m365-gen2"
      }
      osStorageType = "ssd_512gb"
      sku = {
        name = "general_i_16c64gb512ssd_v2"
      }
    }
  })
}

resource "azapi_resource" "go_dev_box_definition" {
  type      = "Microsoft.DevCenter/devcenters/devboxdefinitions@2023-04-01"
  name      = "go-stack-dev-box-definition"
  location  = azurerm_resource_group.this.location
  parent_id = azurerm_dev_center.this.id
  tags      = local.tags_azapi
  body = jsonencode({
    properties = {
      hibernateSupport = "Enabled"
      imageReference = {
        id = "${azurerm_dev_center.this.id}/galleries/default/images/microsoftvisualstudio_visualstudioplustools_vs-2022-ent-general-win11-m365-gen2"
      }
      osStorageType = "ssd_512gb"
      sku = {
        name = "general_i_16c64gb512ssd_v2"
      }
    }
  })
}


