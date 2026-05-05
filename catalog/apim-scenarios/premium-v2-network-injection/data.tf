data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "this" {
  count = var.resource_group_name != "" ? 1 : 0
  name  = var.resource_group_name
}

data "template_file" "foundry_policy" {
  template = file("${path.module}/assets/policies/foundry-policy.xml.tpl")
  vars = {
    foundry_backend_id = azurerm_api_management_backend.ms_foundry.name
  }
}
