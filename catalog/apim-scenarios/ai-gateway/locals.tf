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

  open_ai_resources = {
    westus = {
      name     = format("oai-%s", replace(local.resource_suffix_kebabcase, var.region, "wus"))
      location = "westus"
      priority = 1
      weight   = 100
    },
    swedencentral ={
      name     = format("oai-%s", replace(local.resource_suffix_kebabcase, var.region, "swc"))
      location = "swedencentral"
      priority = 2
      weight   = 50
    },
    uksouth = {
      name     = format("oai-%s", replace(local.resource_suffix_kebabcase, var.region, "uk"))
      location = "uksouth"
      priority = 2
      weight   = 50
    }
  }


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
