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

# resource "azapi_resource" "workspace_1_diagnostic_settings" {
#   type      = "Microsoft.ApiManagement/service/workspaces/diagnostics@2023-09-01-preview"
#   name      = "apim-${var.workspace.name}-diagnostic-settings"
#   parent_id = azapi_resource.workspace_1.id
#   body = jsonencode({
#     properties = {
#       alwaysLog = "allErrors"
#       # backend = {
#       #   request = {
#       #     body = {
#       #       bytes = int
#       #     }
#       #     dataMasking = {
#       #       headers = [
#       #         {
#       #           mode = "string"
#       #           value = "string"
#       #         }
#       #       ]
#       #       queryParams = [
#       #         {
#       #           mode = "string"
#       #           value = "string"
#       #         }
#       #       ]
#       #     }
#       #     headers = [
#       #       "string"
#       #     ]
#       #   }
#       #   response = {
#       #     body = {
#       #       bytes = int
#       #     }
#       #     dataMasking = {
#       #       headers = [
#       #         {
#       #           mode = "string"
#       #           value = "string"
#       #         }
#       #       ]
#       #       queryParams = [
#       #         {
#       #           mode = "string"
#       #           value = "string"
#       #         }
#       #       ]
#       #     }
#       #     headers = [
#       #       "string"
#       #     ]
#       #   }
#       # }
#       # frontend = {
#       #   request = {
#       #     body = {
#       #       bytes = int
#       #     }
#       #     dataMasking = {
#       #       headers = [
#       #         {
#       #           mode = "string"
#       #           value = "string"
#       #         }
#       #       ]
#       #       queryParams = [
#       #         {
#       #           mode = "string"
#       #           value = "string"
#       #         }
#       #       ]
#       #     }
#       #     headers = [
#       #       "string"
#       #     ]
#       #   }
#       #   response = {
#       #     body = {
#       #       bytes = int
#       #     }
#       #     dataMasking = {
#       #       headers = [
#       #         {
#       #           mode = "string"
#       #           value = "string"
#       #         }
#       #       ]
#       #       queryParams = [
#       #         {
#       #           mode = "string"
#       #           value = "string"
#       #         }
#       #       ]
#       #     }
#       #     headers = [
#       #       "string"
#       #     ]
#       #   }
#       # }
#       # httpCorrelationProtocol = "string"
#       # largeLanguageModel = {
#       #   logs = "string"
#       #   requests = {
#       #     maxSizeInBytes = int
#       #     messages = "string"
#       #   }
#       #   responses = {
#       #     maxSizeInBytes = int
#       #     messages = "string"
#       #   }
#       # }
#       # logClientIp = bool
#       loggerId = "/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-nwk-api-1637/providers/Microsoft.OperationalInsights/workspaces/log-dev-eus2-nwk-api-1637"
#       # metrics = bool
#       # operationNameFormat = "string"
#       sampling = {
#         percentage = 100
#         samplingType = "fixed"
#       }
#       # verbosity = "string"
#     }
#   })
# }
