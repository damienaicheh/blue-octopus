
resource "azurerm_container_app_job" "queue_reader_job" {
  name                         = format("ca-qr-%s", local.resource_suffix_kebabcase)
  location                     = local.resource_group_location
  resource_group_name          = local.resource_group_name
  container_app_environment_id = azurerm_container_app_environment.this.id

  replica_timeout_in_seconds = 1800

  identity {
    type = "SystemAssigned"
  }

  event_trigger_config {
    scale {
      min_executions              = 0
      max_executions              = 10
      polling_interval_in_seconds = 60
      rules {
        name             = "queue"
        custom_rule_type = "azure-queue"
        metadata = {
          "accountName" = azurerm_storage_account.this.name,
          "queueName"   = azurerm_storage_queue.hello_queue.name,
          "queueLength" = "1"
        }
        authentication {
          secret_name       = "connection-string-secret"
          trigger_parameter = "connection"
        }
      }
    }
  }

  secret {
    name  = "connection-string-secret"
    value = azurerm_storage_account.this.primary_connection_string
  }

  template {

    container {
      image = "docker.io/aichehda/queue-reader:1.0"
      name  = "queue-reader"

      env {
        name  = "AZURE_STORAGE_QUEUE_NAME"
        value = azurerm_storage_queue.hello_queue.name
      }

      env {
        name        = "AZURE_STORAGE_CONNECTION_STRING"
        secret_name = "connection-string-secret"
      }

      cpu    = 0.5
      memory = "1Gi"
    }
  }
}



