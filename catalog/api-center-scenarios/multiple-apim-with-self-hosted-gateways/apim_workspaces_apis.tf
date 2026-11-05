# Workspace APIs have no dedicated azurerm resource, so they are managed with azapi.
resource "azapi_resource" "eshop_team_shops_api" {
  type      = "Microsoft.ApiManagement/service/workspaces/apis@2024-05-01"
  name      = "shops"
  parent_id = azurerm_api_management_workspace.eshop_team.id
  body = {
    properties = {
      displayName          = "Shops"
      apiRevision          = "1"
      path                 = "shops"
      protocols            = ["https"]
      subscriptionRequired = false
      format               = "openapi"
      value                = file("${path.module}/assets/apis/shops.yaml")
    }
  }
}

resource "azapi_resource" "eshop_team_billing_api" {
  type      = "Microsoft.ApiManagement/service/workspaces/apis@2024-05-01"
  name      = "billing"
  parent_id = azurerm_api_management_workspace.eshop_team.id
  body = {
    properties = {
      displayName          = "Billing"
      apiRevision          = "1"
      path                 = "billing"
      protocols            = ["https"]
      subscriptionRequired = false
      format               = "openapi"
      value                = file("${path.module}/assets/apis/billing.yaml")
    }
  }
}
