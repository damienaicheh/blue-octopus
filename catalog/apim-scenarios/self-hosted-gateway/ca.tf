resource "azurerm_container_app" "self_hosted_gateway" {
  name                         = format("ca-shg-%s", local.resource_suffix_kebabcase)
  resource_group_name          = local.resource_group_name
  container_app_environment_id = azurerm_container_app_environment.this.id
  tags                         = local.tags
  workload_profile_name        = "Consumption"

  identity {
    type = "SystemAssigned"
  }

  revision_mode = "Single"

  ingress {
    allow_insecure_connections = false
    external_enabled           = true
    target_port                = 8080
    transport                  = "auto"

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  secret {
    name                = "self-hosted-gateway-token-secret"
    identity            = "System"
    key_vault_secret_id = azurerm_key_vault_secret.self_hosted_gateway_token.versionless_id
  }

  template {
    container {
      name   = "self-hosted-gateway"
      cpu    = "4.0"
      memory = "8Gi"
      image  = "mcr.microsoft.com/azure-api-management/gateway:2.9.0"

      env {
        name  = "config.service.endpoint"
        value = format("%s.configuration.azure-api.net", azurerm_api_management.this.name)
      }

      env {
        name        = "config.service.auth"
        secret_name = "self-hosted-gateway-token-secret"
      }

      env {
        name  = "net.server.http.forwarded.proto.enabled"
        value = "true"
      }

      env {
        name  = "telemetry.logs.std.level"
        value = "info"
      }

      env {
        name  = "telemetry.logs.std"
        value = "json"
      }

      env {
        name  = "telemetry.logs.local"
        value = "auto"
      }
    }

    http_scale_rule {
      concurrent_requests = "10"
      name                = "http-scaler"
    }

    min_replicas = 1
    max_replicas = 10
  }
}
