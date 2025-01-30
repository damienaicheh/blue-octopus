data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "this" {
  count = var.resource_group_name != "" ? 1 : 0
  name  = var.resource_group_name
}

data "template_file" "pets_store_api" {
  template = file("${path.module}/assets/apis/pets_store.yaml")
}