resource "azapi_resource" "application_insights" {
  type                      = "Microsoft.Insights/components@2020-02-02"
  name                      = format("appi-%s", local.resource_suffix_kebabcase)
  parent_id                 = local.resource_group_id
  location                  = local.resource_group_location
  tags                      = local.tags
  schema_validation_enabled = false
  body = {
    kind = "web"
    properties = {
      Application_Type = "web"
      WorkspaceResourceId      = azapi_resource.log_analytics_workspace.id
      CustomMetricsOptedInType = "WithDimensions"
    }
  }

  response_export_values = ["*"]
}
