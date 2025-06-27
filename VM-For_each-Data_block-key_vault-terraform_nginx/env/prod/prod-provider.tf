terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "mit-rg1"
    storage_account_name = "mitstoragebackend"
    container_name = "backend-con"
    key = "terraform-for-each-backend.tfstate"

  }


}
provider "azurerm" {
  subscription_id = "f569e8dc-40e1-4d01-9de4-e79fd05beaa6"
  features {

  }

}
