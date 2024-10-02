terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.3.0"
    }
  }

  backend "local" {}
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
