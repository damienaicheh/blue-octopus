resource "azurerm_container_app_environment" "region_1" {
  name                       = replace(format("cae-%s", local.resource_suffix_kebabcase), var.environment, "prod")
  location                   = local.resource_group_location
  resource_group_name        = local.resource_group_name
  logs_destination           = "log-analytics"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
  tags                       = local.tags
  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
  }
}

resource "azurerm_container_app_environment" "region_2" {
  name                       = replace(replace(format("cae-%s", local.resource_suffix_kebabcase), var.region, var.region_2), var.environment, "prod")
  location                   = var.location_2
  resource_group_name        = local.resource_group_name
  logs_destination           = "log-analytics"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
  tags                       = local.tags
  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
  }
}
