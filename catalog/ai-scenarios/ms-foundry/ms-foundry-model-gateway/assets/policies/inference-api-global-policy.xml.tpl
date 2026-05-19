<policies>
    <inbound>
        <base />
        <!-- Validate JWT token issued by Microsoft Entra ID -->
        <validate-jwt header-name="Authorization" failed-validation-httpcode="401" failed-validation-error-message="Unauthorized. Valid JWT token required." require-expiration-time="true" require-scheme="Bearer" require-signed-tokens="true" output-token-variable-name="jwt">
            <openid-config url="https://login.microsoftonline.com/${tenant-id}/v2.0/.well-known/openid-configuration" />
            <audiences>
                <audience>https://management.azure.com</audience>
                <!-- Add additional audiences if needed -->
            </audiences>
            <issuers>
                <issuer>https://sts.windows.net/${tenant-id}/</issuer>
                <issuer>https://login.microsoftonline.com/${tenant-id}/v2.0</issuer>
            </issuers>
        </validate-jwt>

        <!-- Extract username and app id from the JWT token for telemetry -->
        <set-variable name="username" value="@{
            try {
                Jwt jwt = (Jwt)context.Variables["jwt"];
                if (jwt.Claims.ContainsKey("upn") && jwt.Claims["upn"].Count() > 0) {
                    return jwt.Claims["upn"][0];
                }
                if (jwt.Claims.ContainsKey("unique_name") && jwt.Claims["unique_name"].Count() > 0) {
                    return jwt.Claims["unique_name"][0];
                }
                if (jwt.Claims.ContainsKey("preferred_username") && jwt.Claims["preferred_username"].Count() > 0) {
                    return jwt.Claims["preferred_username"][0];
                }
                if (jwt.Claims.ContainsKey("email") && jwt.Claims["email"].Count() > 0) {
                    return jwt.Claims["email"][0];
                }
                return jwt.Subject ?? "unknown";
            }
            catch {
                return "error";
            }
        }" />
        <set-variable name="app-id" value="@{
            try {
                Jwt jwt = (Jwt)context.Variables["jwt"];
                return jwt.Claims.ContainsKey("appid") ? jwt.Claims["appid"][0] : "unknown";
            }
            catch {
                return "error";
            }
        }" />
        <!-- Emit usage custom metric-->
        <emit-metric name="FoundryModelsRequest" value="1" namespace="FoundryModel">
            <dimension name="username" value="@((string)context.Variables["username"])" />
            <dimension name="app_id" value="@((string)context.Variables["app-id"])" />
            <dimension name="operation" value="@(context.Operation.Name)" />
            <dimension name="api_name" value="@(context.Api.Name)" />
        </emit-metric>
        <llm-emit-token-metric namespace="FoundryModelLLMRequest">
            <dimension name="username" value="@((string)context.Variables["username"])" />
            <dimension name="Client IP" value="@(context.Request.IpAddress)" />
            <dimension name="app_id" value="@((string)context.Variables["app-id"])" />
        </llm-emit-token-metric>
        <!-- Set the backend service to the Foundry model gateway -->
        <set-backend-service backend-id="${foundry_backend_name}" />
        <set-header name="api-key" exists-action="delete" />
        <!-- Check if the request is a streaming request by looking for "stream" property in the JSON body -->
        <choose>
            <when condition="@(context.Request.Body.As<JObject>(true)["stream"] != null && context.Request.Body.As<JObject>(true)["stream"].Type != JTokenType.Null)">
                <set-variable name="isStream" value="@{
                    var content = (context.Request.Body?.As<JObject>(true));
                    string streamValue = content["stream"].ToString();
                    return streamValue;
                }" />
            </when>
        </choose>
    </inbound>
    <backend>
        <base />
    </backend>
    <outbound>
        <base />
        <!-- Set x-ms-stream header in the response if the request is a streaming request, so that the client can handle the response accordingly -->
        <set-header name="x-ms-stream" exists-action="override">
            <value>@{
                    return context.Variables.GetValueOrDefault<string>("isStream","false").Equals("true", StringComparison.OrdinalIgnoreCase).ToString();
                }</value>
        </set-header>
    </outbound>
    <on-error>
        <base />
    </on-error>
</policies>