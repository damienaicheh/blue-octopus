resource "azapi_resource" "free" {
  type      = "Microsoft.ApiManagement/service/workspaces/products@2023-09-01-preview"
  name      = "free"
  parent_id = local.workspace_1_id
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