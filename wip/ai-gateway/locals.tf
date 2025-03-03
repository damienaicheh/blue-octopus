locals {
  resource_suffix               = [lower(var.environment), lower(var.region), lower(var.domain), lower(var.workload), random_id.resource_group_name_suffix.hex]
  resource_suffix_swc           = [lower(var.environment), lower(var.region_swc), lower(var.domain), lower(var.workload), random_id.resource_group_name_suffix.hex]
  resource_suffix_kebabcase     = join("-", local.resource_suffix)
  resource_suffix_kebabcase_swc = join("-", local.resource_suffix_swc)
  resource_suffix_lowercase     = join("", local.resource_suffix)
  resource_suffix_lowercase_swc = join("", local.resource_suffix_swc)


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

  backend_id                         = "openai1"
  diagnostic_settings_body_bytes     = 8192
  diagnostic_settings_headers_to_log = ["Content-type", "User-agent", "x-ms-region", "x-ratelimit-remaining-tokens", "x-ratelimit-remaining-requests"]

  open_ai_resources = [
    {
      name     = format("oai-%s", join("-", [lower(var.environment), lower(var.region), lower(var.domain), lower(var.workload), random_id.resource_group_name_suffix.hex]))
      location = var.location
    },
    {
      name     = format("oai-%s", join("-", [lower(var.environment), lower(var.region_swc), lower(var.domain), lower(var.workload), random_id.resource_group_name_suffix.hex]))
      location = var.location_swc
    },
  ]


  tags = merge(
    var.tags,
    tomap(
      {
        "Environment" = var.environment,
        "ProjectName" = "ai",
        "Domain"      = var.domain
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

  open_ai_access_users = concat(
    [data.azurerm_client_config.current.object_id],
    var.open_ai_users
  )
}
