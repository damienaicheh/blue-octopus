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

  project_id_guid = "${substr(azapi_resource.ms_foundry_project.output.properties.internalId, 0, 8)}-${substr(azapi_resource.ms_foundry_project.output.properties.internalId, 8, 4)}-${substr(azapi_resource.ms_foundry_project.output.properties.internalId, 12, 4)}-${substr(azapi_resource.ms_foundry_project.output.properties.internalId, 16, 4)}-${substr(azapi_resource.ms_foundry_project.output.properties.internalId, 20, 12)}"

  # apim_foundry_api_operations = {
  #   for method in toset(["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT", "TRACE"]) :
  #   lower(method) => {
  #     display_name = method
  #     method       = method
  #     operation_id = format("%s-default", lower(method))
  #   }
  # }

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

  tags_azapi = merge(
    local.tags,
    tomap(
      {
        "TypeOfDeployment" = "azapi"
      }
    )
  )
}
