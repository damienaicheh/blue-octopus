# resource "azurerm_log_analytics_workspace" "this" {
#   name                = format("log-%s", local.resource_suffix_kebabcase)
#   location            = local.resource_group_location
#   resource_group_name = local.resource_group_name
#   sku                 = "PerGB2018"
#   retention_in_days   = 30

#   tags = local.tags
# }

resource "azapi_resource" "log_analytics_workspace" {
  type      = "Microsoft.OperationalInsights/workspaces@2023-09-01"
  name      = format("log-%s", local.resource_suffix_kebabcase)
  parent_id = local.resource_group_id
  location  = local.resource_group_location
  tags      = local.tags
  body = {
    properties = {
      features = {
        searchVersion = 1
      }
      retentionInDays = 30
      sku = {
        name = "PerGB2018"
      }
    }
  }
}
