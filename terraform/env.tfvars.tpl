projects = {
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

environment_catalogs = {
  "default-env-catalog" = {
    name   = "default-env-catalog"
    branch = "main"
    path   = "/Environments"
    uri    = "https://github.com/damienaicheh/deployment-environments.git"
  },
  "hands-on-lab-platform-engineering-for-ops" = {
    name   = "hands-on-lab-platform-engineering-for-ops"
    branch = "main"
    path   = "/environments"
    uri    = "https://github.com/microsoft/hands-on-lab-platform-engineering-for-ops.git"
  }
}

key_vault_autorized_users_ids = [
  "00000000-0000-0000-0000-54e70723e382"
]
