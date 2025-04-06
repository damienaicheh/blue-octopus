terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.26.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }

    azapi = {
      source  = "Azure/azapi"
      version = "2.2.0"
    }
  }

  backend "local" {}
  # backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

provider "azapi" {
  # Configuration options
}