resource "azapi_resource" "github_mcp_backend" {
  type      = "Microsoft.ApiManagement/service/backends@2024-06-01-preview"
  name      = "github-mcp-backend"
  parent_id = azapi_resource.apim_dev.id
  body = {
    properties = {
      url      = "https://api.githubcopilot.com/mcp"
      protocol = "http"
    }
  }
}

resource "azapi_resource" "ms_learn_mcp_backend" {
  type      = "Microsoft.ApiManagement/service/backends@2024-06-01-preview"
  name      = "ms-learn-mcp-backend"
  parent_id = azapi_resource.apim_dev.id
  body = {
    properties = {
      url      = "https://learn.microsoft.com/api/mcp"
      protocol = "http"
    }
  }
}
