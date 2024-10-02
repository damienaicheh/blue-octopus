resource "azapi_resource" "free" {
  type      = "Microsoft.ApiManagement/service/workspaces/products@2023-09-01-preview"
  name      = "free"
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${azurerm_api_management.this.resource_group_name}/providers/Microsoft.ApiManagement/service/${azurerm_api_management.this.name}/workspaces/${var.workspace.name}"
  body = jsonencode({
    properties = {
      approvalRequired     = false
      description          = "Get default apis such as the Color one."
      displayName          = "Free"
      state                = "published"
      subscriptionRequired = true
      subscriptionsLimit   = 1
    }
  })
}