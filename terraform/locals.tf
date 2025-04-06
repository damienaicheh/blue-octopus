locals {
  resource_lowercase_array  = [lower(var.environment), substr(lower(var.location), 0, 2), substr(lower(var.domain), 0, 3), substr(lower(var.application), 0, 3), random_id.resource_group_name_suffix.hex]
  resource_suffix_kebabcase = join("-", local.resource_lowercase_array)
  resource_suffix_lowercase = join("", local.resource_lowercase_array)

  germany_west_central = "Germany West Central"

  # Bug in the subscription Id paths
  reformat_dev_center_id = replace(azapi_resource.dev_center.id, "devcenters", "devCenters")

  env_types = distinct(flatten([for k, v in var.projects :
    [for key, env in v.env_types :
      env
  ]]))

  projects_env_types = distinct(flatten([for k, v in var.projects :
    [for key, env in v.env_types :
      {
        id       = join("|", [k, env])
        name     = k
        env_type = env
      }
    ]
  ]))

  tags = merge(
    var.tags,
    tomap(
      {
        "Deployment"  = "terraform",
        "ProjectName" = "blue-octopus",
        "Environment" = var.environment,
        "Location"    = var.location,
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