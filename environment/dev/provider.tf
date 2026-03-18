terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.56.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "devstoragedevaccount"
    resource_group_name  = "rg-gihub-action-dev"
    container_name       = "terraformcotainer"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "6123f378-6ceb-4ba0-83c4-0ed63b739551"
}