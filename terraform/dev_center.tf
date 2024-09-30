resource "azurerm_dev_center" "this" {
  name                = format("dvc-%s", local.resource_suffix_kebabcase)
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = local.tags

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_dev_center_gallery" "this" {
  dev_center_id     = azurerm_dev_center.this.id
  shared_gallery_id = azurerm_shared_image_gallery.this.id
  name              = format("dvcgal%s", local.resource_suffix_lowercase)
  
  depends_on = [
    azurerm_role_assignment.dev_center_subscription_contributor
  ]
}

resource "azurerm_dev_center_environment_type" "this" {
  for_each      = toset(local.env_types)
  name          = each.key
  dev_center_id = azurerm_dev_center.this.id

  tags = local.tags
}