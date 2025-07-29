resource "azurerm_linux_function_app" "this" {
  name                = format("func-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location

  builtin_logging_enabled       = true
  https_only                    = true
  public_network_access_enabled = false

  storage_account_name          = azurerm_storage_account.host.name
  storage_uses_managed_identity = true
  service_plan_id               = azurerm_service_plan.this.id
  virtual_network_subnet_id     = azurerm_subnet.subnet_func_plan.id

  tags = local.tags

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.function_identity.id]
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME                = "dotnet-isolated"
    FUNCTIONS_EXTENSION_VERSION             = "~4"
    APPLICATIONINSIGHTS_CONNECTION_STRING   = azurerm_application_insights.this.connection_string
    AzureWebJobsStorage__clientId           = azurerm_user_assigned_identity.function_identity.client_id
    AzureWebJobsStorage__credential         = "managedidentity"
    AzureWebJobsStorage__blobServiceUri     = format("https://%s.blob.core.windows.net/", azurerm_storage_account.host.name)
    AzureWebJobsStorage__queueServiceUri    = format("https://%s.queue.core.windows.net/", azurerm_storage_account.host.name)
    AzureWebJobsStorage__tableServiceUri    = format("https://%s.table.core.windows.net/", azurerm_storage_account.host.name)
    STORAGE_QUEUE_NAME                      = azurerm_storage_queue.hello_queue.name
    StorageQueueConnection__clientId        = azurerm_user_assigned_identity.function_identity.client_id
    StorageQueueConnection__credential      = "managedidentity"
    StorageQueueConnection__queueServiceUri = format("https://%s.queue.core.windows.net/", azurerm_storage_account.storage.name)
  }

  site_config {
    application_insights_connection_string = azurerm_application_insights.this.connection_string
    ftps_state                             = "FtpsOnly"
    application_stack {
      dotnet_version              = "8.0"
      use_dotnet_isolated_runtime = true
    }

    cors {
      # Needed to test the Azure Function
      # https://learn.microsoft.com/en-us/azure/azure-functions/functions-networking-options?tabs=azure-portal#testing-considerations
      allowed_origins = [
        "https://functions-next.azure.com",
        "https://functions-staging.azure.com",
        "https://functions.azure.com",
        "https://portal.azure.com"
      ]
      support_credentials = true
    }
  }
}
