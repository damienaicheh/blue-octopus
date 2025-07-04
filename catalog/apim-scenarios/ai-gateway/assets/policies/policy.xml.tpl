<policies>
    <inbound>
        <base />
        <authentication-managed-identity resource="https://cognitiveservices.azure.com" output-token-variable-name="managed-id-access-token" ignore-error="false" /> 
        <set-header name="Authorization" exists-action="override">  
            <value>@("Bearer " + (string)context.Variables["managed-id-access-token"])</value>  
        </set-header>
        <set-backend-service backend-id="${backend-pool-id}" />
        <!-- azure-openai-token-limit counter-key="@(context.Subscription.Id)" tokens-per-minute="500" estimate-prompt-tokens="false" remaining-tokens-variable-name="remainingTokens"/ -->
        <azure-openai-emit-token-metric namespace="openai">
            <dimension name="Subscription ID" value="@(context.Subscription.Id)" />
            <dimension name="Client IP" value="@(context.Request.IpAddress)" />
            <dimension name="API ID" value="@(context.Api.Id)" />
            <dimension name="User ID" value="@(context.Request.Headers.GetValueOrDefault("x-user-id","N/A"))"/>
        </azure-openai-emit-token-metric>    
    </inbound>
    <backend>
        <!--Set count to one less than the number of backends in the pool to try all backends until the backend pool is temporarily unavailable.-->
        <retry count="2" interval="0" first-fast-retry="true" condition="@(context.Response.StatusCode == 429 || (context.Response.StatusCode == 503 && !context.Response.StatusReason.Contains("Backend pool") && !context.Response.StatusReason.Contains("is temporarily unavailable")))">
            <forward-request buffer-request-body="true" />
        </retry>
    </backend>
    <outbound>
        <base />
    </outbound>
    <on-error>
        <base />
        <choose>
            <!--Return a generic error that does not reveal backend pool details.-->
            <when condition="@(context.Response.StatusCode == 503)">
                <return-response>
                    <set-status code="503" reason="Service Unavailable" />
                </return-response>
            </when>
        </choose>
    </on-error>
</policies>
