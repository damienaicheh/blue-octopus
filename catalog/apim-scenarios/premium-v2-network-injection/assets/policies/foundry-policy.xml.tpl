<policies>
    <inbound>
        <base />
        <set-backend-service id="apim-generated-policy" backend-id="${foundry_backend_id}" />
        <choose>
            <when condition="@(context.Variables.ContainsKey("tokenlimit-"+(string)context.Request.Foundry.Deployment) || context.Variables.ContainsKey("tokenquota-"+(string)context.Request.Foundry.Deployment))">
                <set-variable name="deploymentName" value="@((string)context.Request.Foundry.Deployment)" />
                <set-variable name="counterKey" value="@("product/"+ context.Product?.Id + "/deployment/" + (string)context.Variables["deploymentName"])" />
                <set-variable name="limitVariableName" value="@("tokenlimit-"+(string)context.Variables["deploymentName"])" />
                <set-variable name="quotaVariableName" value="@("tokenquota-"+(string)context.Variables["deploymentName"])" />
                <set-variable name="tokenLimitValue" value="@(context.Variables.ContainsKey((string)context.Variables["limitVariableName"]) ? (string)context.Variables[(string)context.Variables["limitVariableName"]] : null)" />
                <set-variable name="tokenQuotaValue" value="@(context.Variables.ContainsKey((string)context.Variables["quotaVariableName"]) ? ((string)context.Variables[(string)context.Variables["quotaVariableName"]]).Split('|')[0] : null)" />
                <set-variable name="tokenQuotaPeriod" value="@(context.Variables.ContainsKey((string)context.Variables["quotaVariableName"]) ? (((string)context.Variables[(string)context.Variables["quotaVariableName"]]).Split('|').Length > 1 ? ((string)context.Variables[(string)context.Variables["quotaVariableName"]]).Split('|')[1] : null) : null)" />
                <choose>
                    <when condition="@(context.Variables.ContainsKey((string)context.Variables["limitVariableName"]) && context.Variables.ContainsKey((string)context.Variables["quotaVariableName"]))">
                        <choose>
                            <when condition="@(((string)context.Variables["tokenQuotaPeriod"]) == "Hourly")">
                                <llm-token-limit counter-key="@((string)context.Variables["counterKey"])" tokens-per-minute="@(int.Parse((context.Variables["tokenLimitValue"] as string) ?? "0"))" token-quota="@(long.Parse((context.Variables["tokenQuotaValue"] as string) ?? "0"))" token-quota-period="Hourly" estimate-prompt-tokens="false" />
                            </when>
                            <when condition="@(((string)context.Variables["tokenQuotaPeriod"]) == "Daily")">
                                <llm-token-limit counter-key="@((string)context.Variables["counterKey"])" tokens-per-minute="@(int.Parse((context.Variables["tokenLimitValue"] as string) ?? "0"))" token-quota="@(long.Parse((context.Variables["tokenQuotaValue"] as string) ?? "0"))" token-quota-period="Daily" estimate-prompt-tokens="false" />
                            </when>
                            <when condition="@(((string)context.Variables["tokenQuotaPeriod"]) == "Weekly")">
                                <llm-token-limit counter-key="@((string)context.Variables["counterKey"])" tokens-per-minute="@(int.Parse((context.Variables["tokenLimitValue"] as string) ?? "0"))" token-quota="@(long.Parse((context.Variables["tokenQuotaValue"] as string) ?? "0"))" token-quota-period="Weekly" estimate-prompt-tokens="false" />
                            </when>
                            <when condition="@(((string)context.Variables["tokenQuotaPeriod"]) == "Monthly")">
                                <llm-token-limit counter-key="@((string)context.Variables["counterKey"])" tokens-per-minute="@(int.Parse((context.Variables["tokenLimitValue"] as string) ?? "0"))" token-quota="@(long.Parse((context.Variables["tokenQuotaValue"] as string) ?? "0"))" token-quota-period="Monthly" estimate-prompt-tokens="false" />
                            </when>
                            <otherwise>
                                <llm-token-limit counter-key="@((string)context.Variables["counterKey"])" tokens-per-minute="@(int.Parse((context.Variables["tokenLimitValue"] as string) ?? "0"))" token-quota="@(long.Parse((context.Variables["tokenQuotaValue"] as string) ?? "0"))" token-quota-period="Yearly" estimate-prompt-tokens="false" />
                            </otherwise>
                        </choose>
                    </when>
                    <when condition="@(context.Variables.ContainsKey((string)context.Variables["limitVariableName"]))">
                        <llm-token-limit counter-key="@((string)context.Variables["counterKey"])" tokens-per-minute="@(int.Parse((context.Variables["tokenLimitValue"] as string) ?? "0"))" estimate-prompt-tokens="false" />
                    </when>
                    <otherwise>
                        <choose>
                            <when condition="@(((string)context.Variables["tokenQuotaPeriod"]) == "Hourly")">
                                <llm-token-limit counter-key="@((string)context.Variables["counterKey"])" token-quota="@(long.Parse((context.Variables["tokenQuotaValue"] as string) ?? "0"))" token-quota-period="Hourly" estimate-prompt-tokens="false" />
                            </when>
                            <when condition="@(((string)context.Variables["tokenQuotaPeriod"]) == "Daily")">
                                <llm-token-limit counter-key="@((string)context.Variables["counterKey"])" token-quota="@(long.Parse((context.Variables["tokenQuotaValue"] as string) ?? "0"))" token-quota-period="Daily" estimate-prompt-tokens="false" />
                            </when>
                            <when condition="@(((string)context.Variables["tokenQuotaPeriod"]) == "Weekly")">
                                <llm-token-limit counter-key="@((string)context.Variables["counterKey"])" token-quota="@(long.Parse((context.Variables["tokenQuotaValue"] as string) ?? "0"))" token-quota-period="Weekly" estimate-prompt-tokens="false" />
                            </when>
                            <when condition="@(((string)context.Variables["tokenQuotaPeriod"]) == "Monthly")">
                                <llm-token-limit counter-key="@((string)context.Variables["counterKey"])" token-quota="@(long.Parse((context.Variables["tokenQuotaValue"] as string) ?? "0"))" token-quota-period="Monthly" estimate-prompt-tokens="false" />
                            </when>
                            <otherwise>
                                <llm-token-limit counter-key="@((string)context.Variables["counterKey"])" token-quota="@(long.Parse((context.Variables["tokenQuotaValue"] as string) ?? "0"))" token-quota-period="Yearly" estimate-prompt-tokens="false" />
                            </otherwise>
                        </choose>
                    </otherwise>
                </choose>
            </when>
            <otherwise />
        </choose>
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