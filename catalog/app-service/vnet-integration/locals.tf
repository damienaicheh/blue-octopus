locals {
  resource_lowercase_array  = [lower(var.environment), substr(lower(var.location), 0, 2), lower(var.domain), substr(lower(var.application), 0, 3), random_id.resource_group_name_suffix.hex]
  resource_suffix_kebabcase = join("-", local.resource_lowercase_array)
  resource_group_name       = coalesce(data.azurerm_resource_group.this.name, azurerm_resource_group.this[0].name)
  resource_group_location   = coalesce(data.azurerm_resource_group.this.location, azurerm_resource_group.this[0].location)

  tags = merge(
    var.tags,
    tomap(
      {
        "Environment" = var.environment,
        "ProjectName" = "app-service/vnet-integration",
        "Domain"      = var.domain,
        "Application" = var.application
      }
    )
  )
}

