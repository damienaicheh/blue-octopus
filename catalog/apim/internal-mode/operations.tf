resource "azurerm_api_management_api_operation" "request_content" {
  operation_id        = "request-content"
  api_name            = azurerm_api_management_api.tool_box.name
  api_management_name = azurerm_api_management.this.name
  resource_group_name = local.resource_group_name
  display_name        = "Request content"
  method              = "GET"
  url_template        = "/request-content"
  description         = "Request content."

  response {
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation_policy" "request_content" {
  api_name            = azurerm_api_management_api_operation.request_content.api_name
  api_management_name = azurerm_api_management_api_operation.request_content.api_management_name
  resource_group_name = azurerm_api_management_api_operation.request_content.resource_group_name
  operation_id        = azurerm_api_management_api_operation.request_content.operation_id

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