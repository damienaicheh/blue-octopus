resource "azurerm_application_insights" "this" {
  name                = format("appi-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  application_type    = "other"
  workspace_id        = azurerm_log_analytics_workspace.this.id
  tags                = local.tags
}

resource "azurerm_application_insights" "workspace_1" {
  name                = format("appi-wksp-1-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  application_type    = "other"
  workspace_id        = azurerm_log_analytics_workspace.workspace_1.id
  tags                = local.tags
}
