resource "azurerm_shared_image_gallery" "this" {
  name                = format("gal%s", local.resource_suffix_lowercase)
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = local.tags
}
