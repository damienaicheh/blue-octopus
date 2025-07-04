resource "azapi_resource" "ai_services" {
  type      = "Microsoft.CognitiveServices/accounts@2025-04-01-preview"
  name      = format("ais-%s", local.resource_suffix_kebabcase)
  parent_id = local.resource_group_id
  location  = local.resource_group_location
  tags      = local.tags_azapi

  body = {
    kind = "AIServices"
    identity = {
      type = "SystemAssigned"
    }

    properties = {
      allowProjectManagement = true
      publicNetworkAccess = "Enabled"
      customSubDomainName = format("ais-%s", local.resource_suffix_kebabcase)
    }
    sku = {
      name = "S0"
    }
  }
  response_export_values = ["*"]
}