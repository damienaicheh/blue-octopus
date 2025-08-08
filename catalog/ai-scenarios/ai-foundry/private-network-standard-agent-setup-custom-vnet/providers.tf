terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.38.1"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }

    azapi = {
      source  = "Azure/azapi"
      version = "2.5.0"
    }
  }

  backend "local" {}
  # backend "azurerm" {}
}

provider "azurerm" {
  features {
    cognitive_account {
      purge_soft_delete_on_destroy = true
    }
  }
  storage_use_azuread = true
}

provider "azapi" {
  # Configuration options
}
