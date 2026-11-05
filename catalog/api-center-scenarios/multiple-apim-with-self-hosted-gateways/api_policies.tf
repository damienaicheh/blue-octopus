
resource "azurerm_api_management_api_policy" "color_dev_request_content" {
  api_name            = azurerm_api_management_api.colors_dev.name
  api_management_name = azurerm_api_management.apim_dev.name
  resource_group_name = local.resource_group_name

  xml_content = <<XML
<policies>
    <inbound>
        <base />
        <trace source="DeploymentContext" severity="information">
            <message>API Management deployment context</message>
            <metadata name="DeploymentRegion" value="@(context.Deployment.Region)" />
            <metadata name="GatewayInstanceId" value="@(context.Deployment.Gateway.InstanceId)" />
            <metadata name="GatewayIsManaged" value="@(context.Deployment.Gateway.IsManaged.ToString())" />
            <metadata name="ServiceId" value="@(context.Deployment.ServiceId)" />
            <metadata name="ServiceName" value="@(context.Deployment.ServiceName)" />
        </trace>
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
        <trace source="DeploymentContext" severity="information">
            <message>API Management deployment context</message>
            <metadata name="DeploymentRegion" value="@(context.Deployment.Region)" />
            <metadata name="GatewayInstanceId" value="@(context.Deployment.Gateway.InstanceId)" />
            <metadata name="GatewayIsManaged" value="@(context.Deployment.Gateway.IsManaged.ToString())" />
            <metadata name="ServiceId" value="@(context.Deployment.ServiceId)" />
            <metadata name="ServiceName" value="@(context.Deployment.ServiceName)" />
        </trace>
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