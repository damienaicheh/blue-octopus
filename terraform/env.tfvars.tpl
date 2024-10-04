projects = {
  "eshop" = {
    name                       = "eshop"
    maximum_dev_boxes_per_user = 10
    env_types                  = ["dev", "stg", "prd"]
  },
  "showcase" = {
    name                       = "showcase"
    maximum_dev_boxes_per_user = 2
    env_types                  = ["dev", "stg"]
  },
}

environment_catalogs = {
  # "TO_DEFINE" = {
  #   name   = "TO_DEFINE"
  #   branch = "main"
  #   path   = "/TO_DEFINE"
  #   uri    = "https://github.com/TO_DEFINE.git"
  # },
}