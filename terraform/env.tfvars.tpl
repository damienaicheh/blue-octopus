projects = {
  "eshop" = {
    name                       = "eshop"
    description                = "Eshop project"
    maximum_dev_boxes_per_user = 10
    catalog_items_settings     = ["EnvironmentDefinition", "ImageDefinition"]
    env_types                  = ["dev", "stg", "prd"]
  },
  "research" = {
    name                       = "research"
    maximum_dev_boxes_per_user = 2
    description                = "Research project"
    catalog_items_settings     = ["EnvironmentDefinition", "ImageDefinition"]
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
