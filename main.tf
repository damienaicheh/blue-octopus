variable "projects" {
  type = map(object({
    name                       = string
    maximum_dev_boxes_per_user = number
    env_types                  = list(string)
  }))
  description = "The projects to be added in the Dev Center"
  default = {
    "eshop" = {
      name                       = "eshop"
      maximum_dev_boxes_per_user = 10
      env_types                  = ["dev", "stg", "prd"]
    },
    "podcast" = {
      name                       = "podcast"
      maximum_dev_boxes_per_user = 2
      env_types                  = ["dev", "stg"]
    },
    "smart_building" = {
      name                       = "smart-building"
      maximum_dev_boxes_per_user = 2
      env_types                  = ["dev", "stg"]
    }
  }
}

locals {

  projects_env_types = distinct(flatten([for k, v in var.projects :
    [for key, env in v.env_types : 
      { 
        id = join("|", [k, env]) 
        name = k
        env_type = env
      }
    ]
  ]))

  # projects_env_types = [for project_name, project in var.projects :
  # {for env in project.env_types 
  #   "${join("|", [project_name, env])}" = {
  #       project_name = project_name
  #       target_env   = env

  #   }
  #   }
  # ]
  #  ([for env_name, env in project.env_types : {
  #     join("|", [project_name, env]) = {
  #       project_name = project_name
  #       target_env   = env
  #     }
  #     }
  # ])


  #  projects_list = [for project_name, project in var.projects :
  # project_name
  # ]

  #   projects_env_types = [for project_name, project in var.projects :
  #   merge(flatten([for env_name, env in project.env_types : {
  #     join("|", [project_name, env]) = {
  #       project_name = project_name
  #       target_env   = env
  #     }
  #     }
  # ]))]

  # all_envs = flatten([[
  #   "dev",
  #   "stg",
  #   "prd",
  #   ],
  #   [
  #     "dev",
  #     "stg",
  #   ],
  #   [
  #     "dev",
  #     "stg",
  # ]])

  # all_envs = distinct(flatten([for k, v in var.projects :
  #   [for key, env in v.env_types :
  #     # join("-", [k,v.maximum_dev_boxes_per_user])
  #     env
  # ]]))

}

output "projects_results" {
  value = local.projects_env_types
}

# output "projects_list_result" {
#   value = local.all_envs
# }


# output "all_envs" {
#   value = local.all_envs
# }

# output "element_results" {
#   value = local.element
# }
