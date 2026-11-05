data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "this" {
  count = var.resource_group_name != "" ? 1 : 0
  name  = var.resource_group_name
}

data "azapi_resource" "monitoring_ingestion" {
  type        = "Microsoft.Insights/components@2020-02-02"
  resource_id = azapi_resource.application_insights.id

  response_export_values = {
    metrics_endpoint = "properties.MetricsIngestionEndpoint || properties.OTLPMetricsEndpoint"
    logs_endpoint    = "properties.LogsIngestionEndpoint || properties.OTLPLogsEndpoint"
    traces_endpoint  = "properties.TracesIngestionEndpoint || properties.OTLPTracesEndpoint"
    dcr_id           = "properties.DefaultDataCollectionRuleResourceId || properties.DataCollectionRuleResourceId"
    workspace_id     = "properties.WorkspaceResourceId"
  }

  depends_on = [azapi_resource.application_insights]

  lifecycle {
    postcondition {
      condition = alltrue([
        for field in ["metrics_endpoint", "logs_endpoint", "traces_endpoint", "dcr_id"] :
        try(length(self.output[field]) > 0, false)
      ])
      error_message = "Application Insights has not populated its OTLP endpoints or managed DCR yet. Wait for Azure provisioning to complete, then run terraform apply again."
    }

    postcondition {
      condition     = try(lower(self.output.workspace_id) == lower(azapi_resource.log_analytics_workspace.id), false)
      error_message = "Application Insights must be connected to the Log Analytics workspace managed by this configuration."
    }
  }
}