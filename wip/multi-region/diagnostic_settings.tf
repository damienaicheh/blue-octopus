resource "azurerm_monitor_diagnostic_setting" "apim" {
  name                           = "apim-diagnostic-settings"
  target_resource_id             = azurerm_api_management.this.id
  log_analytics_destination_type = "Dedicated"
  log_analytics_workspace_id     = azurerm_log_analytics_workspace.this.id

  metric {
    category = "AllMetrics"
    enabled  = true
  }

  enabled_log {
    category = "GatewayLogs" // All other possibilities: DeveloperPortalAuditLogs //WebSocketConnectionLogs
  }

  enabled_log {
    category = "DeveloperPortalAuditLogs"
  }

  // Or use this:
  # enabled_log {
  #   category_group = "allLogs" // All other possibilities: audit
  # }

  # enabled_log {
  #   category_group = "audit"
  # }
}