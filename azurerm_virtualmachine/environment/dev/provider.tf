terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.56.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "devstoragedevaccount"
    resource_group_name  = "rg-dev"
    container_name       = "terraformcotainer"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e05d12f7-07a5-4237-b6f6-c1e092965136"
}