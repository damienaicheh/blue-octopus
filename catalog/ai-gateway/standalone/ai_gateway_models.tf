resource "azapi_resource" "ai_gateway_foundry_model" {
  type                      = "Microsoft.ApiManagement/aigateways/workspaces/modelProviders/models@2025-09-01-preview"
  name                      = azurerm_cognitive_deployment.chat_completion_model.name
  parent_id                 = azapi_resource.ai_gateway_foundry_provider.id
  schema_validation_enabled = false

  body = {
    properties = {
      displayName = azurerm_cognitive_deployment.chat_completion_model.model[0].name
      apiFormat   = "OpenAIChatCompletions"
      supportedEndpoints = [
        "/openai/v1/chat/completions",
        "/openai/v1/responses"
      ]
      deployment = {
        resourceId   = azurerm_cognitive_deployment.chat_completion_model.id
        modelName    = azurerm_cognitive_deployment.chat_completion_model.name
        modelVersion = azurerm_cognitive_deployment.chat_completion_model.model[0].version
      }
      policies = [
        {
          type       = "tokenLimit"
          period     = "minute"
          count      = 10000
          counterKey = ["identity"]
        },
        {
          id         = "monthly-caller-budget"
          type       = "costLimit"
          period     = "month"
          amount     = 10
          counterKey = ["identity"]
        },
        {
          type             = "contentSafety"
          hateSeverity     = "Medium"
          selfHarmSeverity = "Medium"
          sexualSeverity   = "Medium"
          violenceSeverity = "Medium"
        }
      ]
    }
  }
}

resource "azapi_resource" "ai_gateway_model_alias" {
  type                      = "Microsoft.ApiManagement/aigateways/workspaces/aliases@2025-09-01-preview"
  name                      = azapi_resource.ai_gateway_foundry_model.name
  parent_id                 = "${azapi_resource.ai_gateway.id}/workspaces/default"
  schema_validation_enabled = false

  body = {
    properties = {
      aliasName = azapi_resource.ai_gateway_foundry_model.name
      backendModels = [
        {
          resourceId = azapi_resource.ai_gateway_foundry_model.id
          priority   = 0
          weight     = 100
        }
      ]
    }
  }
}

resource "azapi_resource" "ai_gateway_foundry_model_mini" {
  type                      = "Microsoft.ApiManagement/aigateways/workspaces/modelProviders/models@2025-09-01-preview"
  name                      = azurerm_cognitive_deployment.chat_completion_model_mini.name
  parent_id                 = azapi_resource.ai_gateway_foundry_provider.id
  schema_validation_enabled = false

  body = {
    properties = {
      displayName = azurerm_cognitive_deployment.chat_completion_model_mini.model[0].name
      apiFormat   = "OpenAIChatCompletions"
      supportedEndpoints = [
        "/openai/v1/chat/completions",
        "/openai/v1/responses"
      ]
      deployment = {
        resourceId   = azurerm_cognitive_deployment.chat_completion_model_mini.id
        modelName    = azurerm_cognitive_deployment.chat_completion_model_mini.name
        modelVersion = azurerm_cognitive_deployment.chat_completion_model_mini.model[0].version
      }
      policies = [
        {
          id         = "monthly-caller-budget"
          type       = "costLimit"
          period     = "month"
          amount     = 100
          counterKey = ["identity"]
        }
      ]
    }
  }
}

resource "azapi_resource" "ai_gateway_model_alias_mini" {
  type                      = "Microsoft.ApiManagement/aigateways/workspaces/aliases@2025-09-01-preview"
  name                      = azapi_resource.ai_gateway_foundry_model_mini.name
  parent_id                 = "${azapi_resource.ai_gateway.id}/workspaces/default"
  schema_validation_enabled = false

  body = {
    properties = {
      aliasName = azapi_resource.ai_gateway_foundry_model_mini.name
      backendModels = [
        {
          resourceId = azapi_resource.ai_gateway_foundry_model_mini.id
          priority   = 0
          weight     = 100
        }
      ]
    }
  }
}