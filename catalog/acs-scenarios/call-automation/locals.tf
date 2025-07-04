locals {
  resource_lowercase_array  = [lower(var.environment), substr(lower(var.location), 0, 2), substr(lower(var.domain), 0, 3), substr(lower(var.application), 0, 3), random_id.resource_group_name_suffix.hex]
  resource_suffix_kebabcase = join("-", local.resource_lowercase_array)
  resource_suffix_lowercase = join("", local.resource_lowercase_array)

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
        "Deployment"      = "terraform",
        "ProjectName"     = "ai-call",
        "Environment"     = var.environment,
        "Location"        = var.location,
        "SecurityControl" = "Ignore"
        "CostControl"     = "Ignore"
        "azd-env-name"    = var.environment
      }
    )
  )

  tags_azapi = merge(
    local.tags,
    tomap(
      {
        "TypeOfDeployment" = "azapi"
      }
    )
  )
}
