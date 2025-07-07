resource "azurerm_linux_function_app" "this" {
  name                = format("func-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location

  builtin_logging_enabled       = true
  https_only                    = true
  public_network_access_enabled = false

  storage_account_name                           = azurerm_storage_account.this.name
  storage_uses_managed_identity                  = true
  service_plan_id                                = azurerm_service_plan.this.id
  virtual_network_subnet_id                      = azurerm_subnet.subnet_func_plan.id
  ftp_publish_basic_authentication_enabled       = false
  webdeploy_publish_basic_authentication_enabled = false

  tags = local.tags

  # identity {
  #   type = "SystemAssigned"
  # }

  identity {
    type = "SystemAssigned, UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.function_identity.id
    ]
  }

  app_settings = {
    AzureWebJobsStorage__clientId          = azurerm_user_assigned_identity.function_identity.client_id
    AzureWebJobsStorage__credential        = "managedidentity"
    FUNCTIONS_WORKER_RUNTIME               = "dotnet-isolated"
    WEBSITE_USE_PLACEHOLDER_DOTNETISOLATED = "1"
    SCM_DO_BUILD_DURING_DEPLOYMENT         = false
    AzureWebJobsStorage__accountName       = azurerm_storage_account.this.name
    WEBSITE_CONTENTSHARE                   = format("func-%s", local.resource_suffix_kebabcase)
    WEBSITE_SKIP_CONTENTSHARE_VALIDATION   = 1
    WEBSITE_VNET_ROUTE_ALL                 = true
    # WEBSITE_CONTENTAZUREFILECONNECTIONSTRING = azurerm_storage_account.this.primary_blob_connection_string
    WEBSITE_CONTENTAZUREFILECONNECTIONSTRING = "@Microsoft.KeyVault(SecretUri=https://kv-${local.resource_suffix_kebabcase}.vault.azure.net/secrets/${azurerm_key_vault_secret.website_content_azure_file_connection_string.name}/)"
  }

  site_config {
    application_insights_connection_string = azurerm_application_insights.this.connection_string
    ftps_state                             = "FtpsOnly"
    vnet_route_all_enabled                 = true
    health_check_eviction_time_in_min      = 10
    health_check_path                      = "/api/Health"

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

  depends_on = [
    azurerm_key_vault_secret.website_content_azure_file_connection_string
  ]
}