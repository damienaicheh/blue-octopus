resource "azurerm_api_management_api" "colors" {
  name                  = "colors-api"
  resource_group_name   = local.resource_group_name
  api_management_name   = azurerm_api_management.this.name
  revision              = "1"
  display_name          = "Colors"
  path                  = "api-colors"
  protocols             = ["https"]
  service_url           = "https://colors-api.azurewebsites.net/"
  subscription_required = false
}


resource "azurerm_api_management_api_policy" "request_content" {
  api_name            = azurerm_api_management_api.colors.name
  api_management_name = azurerm_api_management.this.name
  resource_group_name = local.resource_group_name

  xml_content = <<XML
<policies>
    <inbound>
        <base />
    </inbound>
    <backend>
        <base />
    </backend>
    <outbound>
        <base />
        <set-header name="DeploymentRegion" exists-action="append">
            <value>@(context.Deployment.Region)</value>
        </set-header>
        <set-header name="GatewayInstanceId" exists-action="append">
            <value>@(context.Deployment.Gateway.InstanceId)</value>
        </set-header>
        <set-header name="GatewayIsManaged" exists-action="append">
            <value>@(context.Deployment.Gateway.IsManaged.ToString())</value>
        </set-header>
        <set-header name="ServiceId" exists-action="append">
            <value>@(context.Deployment.ServiceId)</value>
        </set-header>
        <set-header name="ServiceName" exists-action="append">
            <value>@(context.Deployment.ServiceName)</value>
        </set-header>
    </outbound>
    <on-error>
        <base />
    </on-error>
</policies>
XML
}