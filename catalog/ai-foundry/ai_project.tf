resource "azapi_resource" "project" {
  type      = "Microsoft.MachineLearningServices/workspaces@2024-10-01"
  name      = format("proj-sdx-%s", local.resource_suffix_kebabcase)
  location  = local.resource_group_location
  parent_id = local.resource_group_id

  identity {
    type = "SystemAssigned"
  }

  body = {
    properties = {
      description   = "Sandbox AI Project"
      friendlyName  = "Sandbox"
      hubResourceId = azapi_resource.hub.id
    }
    kind = "Project"
  }
}