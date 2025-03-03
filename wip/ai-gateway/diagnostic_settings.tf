resource "azurerm_api_management_diagnostic" "this" {
  identifier               = "applicationinsights"
  resource_group_name      = local.resource_group_name
  api_management_name      = azapi_resource.apim.name
  api_management_logger_id = azurerm_api_management_logger.this.id

  sampling_percentage       = 100
  always_log_errors         = true
  log_client_ip             = true
  verbosity                 = "verbose"
  http_correlation_protocol = "W3C"

  frontend_request {
    body_bytes     = local.diagnostic_settings_body_bytes
    headers_to_log = local.diagnostic_settings_headers_to_log
  }

  frontend_response {
    body_bytes     = local.diagnostic_settings_body_bytes
    headers_to_log = local.diagnostic_settings_headers_to_log
  }

  backend_request {
    body_bytes     = local.diagnostic_settings_body_bytes
    headers_to_log = local.diagnostic_settings_headers_to_log
  }

  backend_response {
    body_bytes     = local.diagnostic_settings_body_bytes
    headers_to_log = local.diagnostic_settings_headers_to_log
  }
}
