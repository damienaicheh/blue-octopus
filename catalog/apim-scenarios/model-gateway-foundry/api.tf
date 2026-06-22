resource "azurerm_api_management_api" "ms_foundry_azure_ai" {
  name                = "inference-api"
  resource_group_name = local.resource_group_name
  api_management_name = azurerm_api_management.this.name
  revision            = "1"
  api_type            = "http"
  description         = "Inference API"
  display_name        = "Inference API"
  path                = "inference/models"
  protocols           = ["https"]

  subscription_key_parameter_names {
    header = "api-key"
    query  = "api-key"
  }

  subscription_required = true

  import {
    content_format = "openapi+json"
    content_value  = data.template_file.inference_api.rendered
  }

  depends_on = [
    azurerm_api_management_backend.ms_foundry_azure_ai,
  ]
}

resource "azapi_resource" "api_diagnostic_ms_foundry_azure_ai" {
  type                      = "Microsoft.ApiManagement/service/apis/diagnostics@2022-08-01"
  name                      = "applicationinsights"
  parent_id                 = azurerm_api_management_api.ms_foundry_azure_ai.id
  schema_validation_enabled = false

  body = {
    properties = {
      alwaysLog               = "allErrors"
      httpCorrelationProtocol = "W3C"
      logClientIp             = true
      loggerId                = azurerm_api_management_logger.this.id
      metrics                 = true
      verbosity               = "verbose"
      sampling = {
        samplingType = "fixed"
        percentage   = 100
      }
      frontend = {
        request = {
          headers = [
            "Content-type",
            "User-agent",
            "x-ms-region",
            "x-ratelimit-remaining-tokens",
            "x-ratelimit-remaining-requests",
          ]
          body = {
            bytes = 8192
          }
        }
        response = {
          headers = [
            "Content-type",
            "User-agent",
            "x-ms-region",
            "x-ratelimit-remaining-tokens",
            "x-ratelimit-remaining-requests",
          ]
          body = {
            bytes = 8192
          }
        }
      }
      backend = {
        request = {
          headers = [
            "Content-type",
            "User-agent",
            "x-ms-region",
            "x-ratelimit-remaining-tokens",
            "x-ratelimit-remaining-requests",
          ]
          body = {
            bytes = 8192
          }
        }
        response = {
          headers = [
            "Content-type",
            "User-agent",
            "x-ms-region",
            "x-ratelimit-remaining-tokens",
            "x-ratelimit-remaining-requests",
          ]
          body = {
            bytes = 8192
          }
        }
      }
    }
  }

  depends_on = [
    azurerm_api_management_api_policy.ms_foundry_azure_ai,
    azurerm_api_management_logger.this,
  ]
}
