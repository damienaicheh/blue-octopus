resource "azurerm_api_management_api" "tool_box" {
  name                  = "tool-box"
  resource_group_name   = local.resource_group_name
  api_management_name   = azurerm_api_management.this.name
  revision              = "1"
  display_name          = "Tool Box"
  path                  = "tbx"
  protocols             = ["https"]
  service_url           = "https://to_define"
  subscription_required = false
}
