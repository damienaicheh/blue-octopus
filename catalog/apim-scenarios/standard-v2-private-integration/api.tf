# resource "azapi_resource" "colors_api" {
#   type      = "Microsoft.ApiManagement/service/workspaces/apis@2023-09-01-preview"
#   name      = "colors-api"
#   parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${azurerm_api_management.this.resource_group_name}/providers/Microsoft.ApiManagement/service/${azurerm_api_management.this.name}/workspaces/${var.workspace.name}"
#   body = jsonencode({
#     properties = {
#       apiRevision = "1"
#       displayName = "Colors"
#       format      = "openapi+json-link"
#       path        = "colors"
#       protocols   = ["https"]
#       type        = "http"
#       value       = "https://colors-api.azurewebsites.net/swagger/v1/swagger.json"
#     }
#   })
#   depends_on = [
#     azapi_resource.workspace_1
#   ]
# }