locals {
  resource_suffix           = [lower(var.environment), lower(var.region), lower(var.domain), lower(var.workload), random_id.resource_group_name_suffix.hex]
  resource_suffix_kebabcase = join("-", local.resource_suffix)

  resource_group_name = coalesce(
    try(data.azurerm_resource_group.this[0].name, null),
    try(azurerm_resource_group.this[0].name, null)
  )
  resource_group_location = coalesce(
    try(data.azurerm_resource_group.this[0].location, null),
    try(azurerm_resource_group.this[0].location, null)
  )

  apim_private_ip_address = try(
    data.azapi_resource.apim_service.output.properties.privateIPAddresses[0],
    cidrhost(azurerm_subnet.subnet_apim.address_prefixes[0], 4)
  )

  tags = merge(
    var.tags,
    tomap(
      {
        "Environment"     = var.environment,
        "ProjectName"     = "ai-scenarios/ms-foundry/private-network",
        "Domain"          = var.domain,
        "SecurityControl" = "Ignore",
        "CostControl"     = "Ignore"
      }
    )
  )
}
