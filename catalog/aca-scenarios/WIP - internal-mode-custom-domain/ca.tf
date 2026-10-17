resource "azurerm_container_app" "hello_world" {
  name                         = format("ca-hello-%s", local.resource_suffix_kebabcase)
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
    target_port                = 80
    transport                  = "auto"

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  template {
    container {
      name   = "simple-hello"
      cpu    = "0.25"
      memory = "0.5Gi"
      image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
    }

    min_replicas = 1
    max_replicas = 10
  }
}
