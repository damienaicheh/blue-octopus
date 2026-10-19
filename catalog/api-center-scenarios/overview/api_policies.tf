
resource "azurerm_api_management_api_policy" "color_dev_request_content" {
  api_name            = azurerm_api_management_api.colors_dev.name
  api_management_name = azurerm_api_management.apim_dev.name
  resource_group_name = local.resource_group_name

  xml_content = <<XML
<policies>
    <inbound>
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
    </inbound>
    <backend>
        <base />
    </backend>
    <outbound>
        <base />
    </outbound>
    <on-error>
        <base />
    </on-error>
</policies>
XML
}

resource "azurerm_api_management_api_policy" "color_prod_colors_request_content" {
  api_name            = azurerm_api_management_api.colors_prod.name
  api_management_name = azurerm_api_management.apim_prod.name
  resource_group_name = local.resource_group_name

  xml_content = <<XML
<policies>
    <inbound>
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
    </inbound>
    <backend>
        <base />
    </backend>
    <outbound>
        <base />
    </outbound>
    <on-error>
        <base />
    </on-error>
</policies>
XML
}