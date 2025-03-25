resource "azurerm_container_app_environment" "this" {
  name                               = format("cae-%s", local.resource_suffix_kebabcase)
  location                           = local.resource_group_location
  resource_group_name                = local.resource_group_name
  log_analytics_workspace_id         = azurerm_log_analytics_workspace.this.id
  infrastructure_subnet_id           = azurerm_subnet.subnet_container_app_environment.id
  internal_load_balancer_enabled     = true
  infrastructure_resource_group_name = format("mng-%s", local.resource_group_name)
  tags                               = local.tags
  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
  }
}
