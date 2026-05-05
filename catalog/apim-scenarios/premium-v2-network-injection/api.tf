resource "azurerm_api_management_api" "ms_foundry" {
  name                  = azapi_resource.ms_foundry.name
  resource_group_name   = local.resource_group_name
  api_management_name   = azurerm_api_management.this.name
  revision              = "1"
  api_type              = "http"
  description           = format("API facade for Foundry %s", azapi_resource.ms_foundry.name)
  display_name          = azapi_resource.ms_foundry.name
  path                  = azapi_resource.ms_foundry.name
  protocols             = ["https"]
  subscription_required = true

  subscription_key_parameter_names {
    header = "api-key"
    query  = "subscription-key"
  }

  depends_on = [
    azurerm_api_management_backend.ms_foundry,
  ]
}

resource "azurerm_api_management_api_operation" "ms_foundry_default" {
  for_each = local.apim_foundry_api_operations

  operation_id        = each.value.operation_id
  api_name            = azurerm_api_management_api.ms_foundry.name
  api_management_name = azurerm_api_management.this.name
  resource_group_name = local.resource_group_name
  display_name        = each.value.display_name
  method              = each.value.method
  url_template        = "/*"
}


resource "azurerm_api_management_api_policy" "ms_foundry" {
  api_name            = azurerm_api_management_api.ms_foundry.name
  api_management_name = azurerm_api_management.this.name
  resource_group_name = local.resource_group_name

  xml_content = data.template_file.foundry_policy.rendered

  depends_on = [
    azurerm_role_assignment.apim_ms_foundry_openai_user,
    azurerm_api_management_api_operation.ms_foundry_default,
  ]
}