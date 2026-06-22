terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.78.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.9.0"
    }

    azapi = {
      source  = "Azure/azapi"
      version = "2.10.0"
    }

    time = {
      source  = "hashicorp/time"
      version = "0.14.0"
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

provider "time" {
  # Configuration options
}