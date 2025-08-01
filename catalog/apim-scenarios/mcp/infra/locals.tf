locals {
  resource_suffix           = [lower(var.environment), lower(var.region), lower(var.domain), lower(var.workload), random_id.resource_group_name_suffix.hex]
  resource_suffix_kebabcase = join("-", local.resource_suffix)
  resource_suffix_lowercase = join("", local.resource_suffix)

  resource_group_id = coalesce(
    try(data.azurerm_resource_group.this[0].id, null),
    try(azurerm_resource_group.this[0].id, null)
  )
  resource_group_name = coalesce(
    try(data.azurerm_resource_group.this[0].name, null),
    try(azurerm_resource_group.this[0].name, null)
  )
  resource_group_location = coalesce(
    try(data.azurerm_resource_group.this[0].location, null),
    try(azurerm_resource_group.this[0].location, null)
  )

  tags = merge(
    var.tags,
    tomap(
      {
        "Environment"     = var.environment,
        "ProjectName"     = "apim/mcp",
        "Domain"          = var.domain,
        "SecurityControl" = "Ignore"
        "CostControl"     = "Ignore"
      }
    )
  )

  open_ai_resources = {
    eastus2 = {
      name     = format("oai-%s", replace(local.resource_suffix_kebabcase, var.region, "ea2"))
      location = "eastus2"
    }
  }
}
