resource "azurerm_container_app" "weather_mcp" {
  name                         = format("ca-weather-%s", local.resource_suffix_kebabcase)
  resource_group_name          = local.resource_group_name
  container_app_environment_id = azurerm_container_app_environment.this.id
  tags                         = local.tags
  workload_profile_name        = "Consumption"

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.container_app_identity.id
    ]
  }

  registry {
    identity = azurerm_user_assigned_identity.container_app_identity.id
    server   = azurerm_container_registry.this.login_server
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

  template {
    container {
      name   = "weather-mcp"
      cpu    = "0.25"
      memory = "0.5Gi"
      image  = "docker.io/jfxs/hello-world:latest"
    }

    min_replicas = 1
    max_replicas = 3
  }

  lifecycle {
    ignore_changes = [
      template[0].container[0].image
    ]
  }
}
