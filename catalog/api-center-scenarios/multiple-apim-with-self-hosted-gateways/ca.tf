resource "azurerm_container_app" "self_hosted_gateway_prod_region_1" {
  name                         = replace(format("ca-shg-%s", local.resource_suffix_kebabcase), var.environment, "prod")
  resource_group_name          = local.resource_group_name
  container_app_environment_id = azurerm_container_app_environment.region_1.id
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
    key_vault_secret_id = azurerm_key_vault_secret.self_hosted_gateway_token_prod_region_1.versionless_id
  }

  template {
    container {
      name   = "self-hosted-gateway"
      cpu    = "4.0"
      memory = "8Gi"
      image  = "mcr.microsoft.com/azure-api-management/gateway:2.12.1"

      env {
        name  = "config.service.endpoint"
        value = format("%s.configuration.azure-api.net", azurerm_api_management.apim_prod.name)
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

resource "azurerm_container_app" "self_hosted_gateway_prod_region_2" {
  name                         = replace(replace(format("ca-shg-%s", local.resource_suffix_kebabcase), var.region, var.region_2), var.environment, "prod")
  resource_group_name          = local.resource_group_name
  container_app_environment_id = azurerm_container_app_environment.region_2.id
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
    key_vault_secret_id = azurerm_key_vault_secret.self_hosted_gateway_token_prod_region_2.versionless_id
  }

  template {
    container {
      name   = "self-hosted-gateway"
      cpu    = "4.0"
      memory = "8Gi"
      image  = "mcr.microsoft.com/azure-api-management/gateway:2.12.1"

      env {
        name  = "config.service.endpoint"
        value = format("%s.configuration.azure-api.net", azurerm_api_management.apim_prod.name)
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