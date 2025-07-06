resource "azurerm_linux_function_app" "this" {
  name                = format("func-%s", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location

  builtin_logging_enabled       = true
  https_only                    = true
  public_network_access_enabled = false

  storage_account_name = azurerm_storage_account.this.name
  #   storage_account_access_key = azurerm_storage_account.this.primary_access_key
  storage_uses_managed_identity = true
  service_plan_id               = azurerm_service_plan.this.id
  virtual_network_subnet_id     = azurerm_subnet.subnet_func_plan.id

  tags = local.tags

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME               = "dotnet-isolated"
    WEBSITE_USE_PLACEHOLDER_DOTNETISOLATED = "1"
    AzureWebJobsStorage__accountName       = azurerm_storage_account.this.name
    WEBSITE_CONTENTSHARE                   = format("func-%s", local.resource_suffix_kebabcase)
    WEBSITE_VNET_ROUTE_ALL                 = true
    WEBSITE_CONTENTAZUREFILECONNECTIONSTRING = azurerm_storage_account.this.primary_connection_string
  }

  site_config {
    application_insights_connection_string = azurerm_application_insights.this.connection_string
    ftps_state                             = "FtpsOnly"
    vnet_route_all_enabled                 = true
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

  #   lifecycle {
  #     ignore_changes = [
  #       app_settings["WEBSITE_CONTENTOVERVNET"],
  #     ]
  #   }
}

# resource "null_resource" "activate_content_over_vnet" {
#   provisioner "local-exec" {
#     command = format("az functionapp config appsettings set --name %s --resource-group %s --settings \"WEBSITE_CONTENTOVERVNET=1\"", azurerm_linux_function_app.this.name, var.resource_group_name)
#   }
#   depends_on = [
#     azurerm_linux_function_app.this,
#     azurerm_private_endpoint.func,
#   ]
# }
