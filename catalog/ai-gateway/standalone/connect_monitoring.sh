#
# bash ./configure-monitoring.sh "nom-resource-group" "nom-ai-gateway" "nom-application-insights"
#

#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 3 ]]; then
  echo "Usage: bash $0 <resource-group> <gateway-name> <application-insights-name>" >&2
  echo "Uses the current Azure CLI subscription. Run az login and az account set first." >&2
  exit 1
fi

for tool in az jq sha256sum; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "Missing required command: $tool" >&2
    exit 1
  fi
done

subscription_id="$(az account show --query id -o tsv)"
resource_group_id="/subscriptions/${subscription_id}/resourceGroups/$1"
gateway_id="${resource_group_id}/providers/Microsoft.ApiManagement/aigateways/$2"
insights_id="${resource_group_id}/providers/Microsoft.Insights/components/$3"
arm="https://management.azure.com"
gateway_api="2025-09-01-preview"
insights_api="2020-02-02"
publisher_role="3913510d-42f4-4e42-8a64-420c390055eb"

gateway="$(az rest --method get --uri "${arm}${gateway_id}?api-version=${gateway_api}" -o json)"
if ! principal_id="$(jq -er '.identity.principalId | select(type == "string" and length > 0)' <<< "$gateway")"; then
  echo "The gateway must have a system-assigned managed identity with a principalId." >&2
  exit 1
fi

provider_state="$(az provider show --namespace Microsoft.Monitor --subscription "$subscription_id" --query registrationState -o tsv)"
if [[ "$provider_state" != "Registered" ]]; then
  az provider register --namespace Microsoft.Monitor --subscription "$subscription_id" --wait -o none
fi

ready=false
for ((attempt = 1; attempt <= 60; attempt++)); do
  insights="$(az rest --method get --uri "${arm}${insights_id}?api-version=${insights_api}" -o json)"
  if ! jq -e '.properties.AzureMonitorWorkspaceIngestionMode == "Enabled"' <<< "$insights" >/dev/null; then
    echo "Application Insights must have AzureMonitorWorkspaceIngestionMode set to Enabled." >&2
    exit 1
  fi

  telemetry="$(jq '
    def first_string: map(select(type == "string" and length > 0)) | first;
    .properties | {
      metrics: ([.MetricsIngestionEndpoint, .OTLPMetricsEndpoint] | first_string),
      logs: ([.LogsIngestionEndpoint, .OTLPLogsEndpoint] | first_string),
      traces: ([.TracesIngestionEndpoint, .OTLPTracesEndpoint] | first_string),
      dcr: ([.DefaultDataCollectionRuleResourceId, .DataCollectionRuleResourceId] | first_string),
      workspace: .WorkspaceResourceId
    }
  ' <<< "$insights")"

  if jq -e 'all(.[]; type == "string" and length > 0)' <<< "$telemetry" >/dev/null; then
    ready=true
    break
  fi
  echo "Waiting for Application Insights OTLP endpoints and managed DCR (${attempt}/60)..."
  if ((attempt < 60)); then
    sleep 10
  fi
done

if [[ "$ready" != true ]]; then
  echo "Application Insights OTLP endpoints or managed DCR are still missing after 60 attempts." >&2
  exit 1
fi

workspace_id="$(jq -r '.workspace' <<< "$telemetry")"
az rest --method get --uri "${arm}${workspace_id}?api-version=2023-09-01" -o none
dcr_id="$(jq -r '.dcr' <<< "$telemetry")"

# Keep the assignment name stable across repeated executions and the sample script.
role_hash="$(printf '%s' "${dcr_id}|${principal_id}|${publisher_role}" | sha256sum)"
role_hash="${role_hash:0:32}"
printf -v assignment_name '%s-%s-%02x%s-%02x%s-%s' \
  "${role_hash:0:8}" "${role_hash:8:4}" \
  "$(((0x${role_hash:12:2} & 0x0f) | 0x50))" "${role_hash:14:2}" \
  "$(((0x${role_hash:16:2} & 0x3f) | 0x80))" "${role_hash:18:2}" "${role_hash:20:12}"

role_body="$(jq -n \
  --arg principal "$principal_id" \
  --arg role "/subscriptions/${subscription_id}/providers/Microsoft.Authorization/roleDefinitions/${publisher_role}" \
  '{properties: {principalId: $principal, principalType: "ServicePrincipal", roleDefinitionId: $role}}')"

echo "Granting Monitoring Metrics Publisher to the gateway identity on its ingestion DCR..."
az rest --method put \
  --uri "${arm}${dcr_id}/providers/Microsoft.Authorization/roleAssignments/${assignment_name}?api-version=2022-04-01" \
  --body "$role_body" -o none

exporter_body="$(jq -n --arg insights "$insights_id" --argjson telemetry "$telemetry" '{
  properties: {
    kind: "OpenTelemetry",
    payloadCapture: false,
    applicationInsights: {resourceId: $insights},
    openTelemetry: {
      metricsEndpoint: $telemetry.metrics,
      logsEndpoint: $telemetry.logs,
      tracesEndpoint: $telemetry.traces,
      credentials: {managedIdentity: {resource: "https://monitor.azure.com"}}
    }
  }
}')"

exporter_uri="${arm}${gateway_id}/workspaces/default/telemetryExporters/applicationInsights?api-version=${gateway_api}"
echo "Configuring the gateway OpenTelemetry exporter..."
az rest --method put --uri "$exporter_uri" --body "$exporter_body" -o none

exporter="$(az rest --method get --uri "$exporter_uri" -o json)"
if ! jq -e --arg insights "$insights_id" --argjson telemetry "$telemetry" '
  .properties |
  .kind == "OpenTelemetry" and
  ((.applicationInsights.resourceId | ascii_downcase) == ($insights | ascii_downcase)) and
  .openTelemetry.metricsEndpoint == $telemetry.metrics and
  .openTelemetry.logsEndpoint == $telemetry.logs
' <<< "$exporter" >/dev/null; then
  echo "The exporter read-back does not match the requested monitoring configuration." >&2
  exit 1
fi

echo "Monitoring exporter configured and verified."
echo "RBAC propagation may take a few minutes. Send traffic through the gateway to verify telemetry ingestion."
