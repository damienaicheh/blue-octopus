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
        "ProjectName"     = "starter",
        "Domain"          = var.domain,
        "SecurityControl" = "Ignore",
        "CostControl"     = "Ignore"
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
  monitoring_publisher_role_id = "3913510d-42f4-4e42-8a64-420c390055eb"
  monitoring_role_hash         = sha256("${data.azapi_resource.monitoring_ingestion.output.dcr_id}|${azapi_resource.ai_gateway.identity[0].principal_id}|${local.monitoring_publisher_role_id}")

  # Preserve the old script's assignment name so existing assignments can be imported.
  monitoring_role_assignment_name = format(
    "%s-%s-5%s-%x%s-%s",
    substr(local.monitoring_role_hash, 0, 8),
    substr(local.monitoring_role_hash, 8, 4),
    substr(local.monitoring_role_hash, 13, 3),
    8 + parseint(substr(local.monitoring_role_hash, 16, 1), 16) % 4,
    substr(local.monitoring_role_hash, 17, 3),
    substr(local.monitoring_role_hash, 20, 12)
  )
}