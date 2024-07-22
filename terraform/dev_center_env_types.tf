resource "azurerm_dev_center_environment_type" "this" {
  for_each      = toset(local.env_types)
  name          = each.key
  dev_center_id = azurerm_dev_center.this.id

  tags = local.tags
}