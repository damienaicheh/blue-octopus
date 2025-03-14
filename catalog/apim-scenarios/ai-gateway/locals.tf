locals {
  resource_suffix           = [lower(var.environment), lower(var.region), lower(var.domain), lower(var.workload), random_id.resource_group_name_suffix.hex]
  resource_suffix_kebabcase = join("-", local.resource_suffix)

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

  backend_pool_name = "openai-backend-pool"

  diagnostic_settings_body_bytes     = 8192
  diagnostic_settings_headers_to_log = ["Content-type", "User-agent", "x-ms-region", "x-ratelimit-remaining-tokens", "x-ratelimit-remaining-requests"]

  location_wus = "westus"
  region_wus   = "wus"

  location_swc = "swedencentral"
  region_swc   = "swc"

  location_uk = "uksouth"
  region_uk   = "uk"

  open_ai_resources = [
    {
      name     = format("oai-%s", replace(local.resource_suffix_kebabcase, var.region, local.region_wus))
      location = local.location_wus
      priority = 1
      weight   = 100
    },
    {
      name     = format("oai-%s", replace(local.resource_suffix_kebabcase, var.region, local.region_swc))
      location = local.location_swc
      priority = 2
      weight   = 50
    },
    {
      name     = format("oai-%s", replace(local.resource_suffix_kebabcase, var.region, local.region_uk))
      location = local.location_uk
      priority = 2
      weight   = 50
    }
  ]


  tags = merge(
    var.tags,
    tomap(
      {
        "Environment" = var.environment,
        "ProjectName" = "apim/ai-gateway",
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
}
