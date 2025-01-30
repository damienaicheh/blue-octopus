resource "azurerm_application_insights" "this" {
  name                = format("appi-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  application_type    = "other"
  workspace_id        = azurerm_log_analytics_workspace.this.id
  tags                = local.tags
}
