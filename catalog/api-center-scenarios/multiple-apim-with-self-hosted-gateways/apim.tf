resource "azurerm_api_management" "apim_dev" {
  name                = format("apim-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags
  publisher_name      = "Me"
  publisher_email     = "admin@me.io"

  sku_name = "BasicV2_1"

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_api_management" "apim_prod" {
  name                = replace(format("apim-%s", local.resource_suffix_kebabcase), var.environment, "prd")
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags
  publisher_name      = "Me"
  publisher_email     = "admin@me.io"

  sku_name = "Premium_1"

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_api_management_logger" "apim_dev" {
  name                = format("apim-logger-%s", local.resource_suffix_kebabcase)
  api_management_name = azurerm_api_management.apim_dev.name
  resource_group_name = local.resource_group_name
  resource_id         = azurerm_application_insights.this.id
  buffered            = false

  application_insights {
    instrumentation_key = azurerm_application_insights.this.instrumentation_key
  }
}

resource "azurerm_api_management_diagnostic" "apim_dev_app_insights" {
  identifier                = "applicationinsights"
  api_management_name       = azurerm_api_management.apim_dev.name
  resource_group_name       = local.resource_group_name
  api_management_logger_id  = azurerm_api_management_logger.apim_dev.id
  sampling_percentage       = 100
  always_log_errors         = true
  log_client_ip             = true
  verbosity                 = "information"
  http_correlation_protocol = "W3C"
}

resource "azurerm_api_management_logger" "this" {
  name                = format("apim-logger-%s", local.resource_suffix_kebabcase)
  api_management_name = azurerm_api_management.apim_prod.name
  resource_group_name = local.resource_group_name
  resource_id         = azurerm_application_insights.this.id
  buffered            = false

  application_insights {
    instrumentation_key = azurerm_application_insights.this.instrumentation_key
  }

  depends_on = [
    azurerm_application_insights.this,
    azurerm_api_management.apim_prod
  ]
}

resource "azurerm_api_management_diagnostic" "apim_prod_app_insights" {
  identifier                = "applicationinsights"
  api_management_name       = azurerm_api_management.apim_prod.name
  resource_group_name       = local.resource_group_name
  api_management_logger_id  = azurerm_api_management_logger.this.id
  sampling_percentage       = 100
  always_log_errors         = true
  log_client_ip             = true
  verbosity                 = "information"
  http_correlation_protocol = "W3C"
}

resource "azurerm_monitor_diagnostic_setting" "apim_prod" {
  name                           = "diag-apim-prod"
  target_resource_id             = azurerm_api_management.apim_prod.id
  log_analytics_workspace_id     = azurerm_log_analytics_workspace.this.id
  log_analytics_destination_type = "Dedicated"

  enabled_log {
    category_group = "allLogs"
  }

  enabled_log {
    category_group = "audit"
  }

  enabled_metric {
    category = "AllMetrics"
  }
}
