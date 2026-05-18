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
      retentionInDays = 90
      sku = {
        name = "PerGB2018"
      }
    }
  }
}