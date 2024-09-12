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
  "showcase" = {
    name                       = "showcase"
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
  "ade_terraform_experiment" = {
    name   = "ade_terraform_experiment"
    branch = "main"
    path   = "/"
    uri    = "  https://github.com/damienaicheh/ade_terraform_experiments.git"
  }
}