terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.12.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.9.1"
    }

    azapi = {
      source  = "Azure/azapi"
      version = "2.10.0"
    }
  }

  backend "local" {}
  # backend "azurerm" {}
}

provider "azurerm" {
  features {}

  # Required when shared_access_key_enabled = false on storage accounts.
  storage_use_azuread = true
}

provider "azapi" {
  # Configuration options
}