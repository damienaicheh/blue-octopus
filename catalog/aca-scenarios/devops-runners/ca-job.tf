resource "azurerm_container_app_job" "gh_runner_job" {
  name                         = format("ca-github-%s", local.resource_suffix_kebabcase)
  location                     = local.resource_group_location
  resource_group_name          = local.resource_group_name
  container_app_environment_id = azurerm_container_app_environment.this.id

  replica_timeout_in_seconds = 3600
  replica_retry_limit        = 1

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.container_app_job_identity.id
    ]
  }

  event_trigger_config {
    parallelism = 1
    scale {
      min_executions              = 0
      max_executions              = 10
      polling_interval_in_seconds = 30
      rules {
        name             = "github-runner"
        custom_rule_type = "github-runner"
        metadata = {
          "github-runner"             = "https://api.github.com",
          "owner"                     = var.gh_repo_owner,
          "runnerScope"               = "repo",
          "repos"                     = var.gh_repo_name,
          "targetWorkflowQueueLength" = 1,
          "labels"                    = "python,python3.9"
        }
        authentication {
          secret_name       = "personal-access-token"
          trigger_parameter = "personalAccessToken"
        }
      }
    }
  }

  secret {
    name                = "personal-access-token"
    identity            = "System"
    key_vault_secret_id = azurerm_key_vault_secret.github_pat.id
    value               = format("https://%s.vault.azure.net/secrets/%s", azurerm_key_vault.this.name, azurerm_key_vault_secret.github_pat.name)
  }

  registry {
    server = "${azurerm_container_registry.this.name}.azurecr.io"
    identity = azurerm_user_assigned_identity.container_app_job_identity.id
  }

  template {

    container {
      image = "${azurerm_container_registry.this.name}.azurecr.io/gh-runner:latest"
      name  = "gh-runner"

      env {
        name  = "REPO_URL"
        value = "https://github.com/${var.gh_repo_owner}/${var.gh_repo_name}"
      }

      env {
        name  = "REGISTRATION_TOKEN_API_URL"
        value = "https://api.github.com/repos/${var.gh_repo_owner}/${var.gh_repo_name}/actions/runners/registration-token"
      }

      env {
        name  = "LABELS"
        value = "python,python3.9"
      }

      env {
        name        = "PERSONAL_ACCESS_TOKEN"
        secret_name = "personal-access-token"
      }

      cpu    = 2.0
      memory = "4Gi"
    }
  }
}
