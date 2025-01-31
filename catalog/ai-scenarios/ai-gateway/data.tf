data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "this" {
  count = var.resource_group_name != "" ? 1 : 0
  name  = var.resource_group_name
}

data "template_file" "policy" {
  template = file("${path.module}/assets/policies/policy.xml")
  vars = {
  }
}