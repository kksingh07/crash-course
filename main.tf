terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.73.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Infy-rg-02"
    storage_account_name = "hitachistoraccblock"
    container_name       = "infy-container-block"
    key                  = "jiwan.tfstate"
  }
}

provider "azurerm" {
  features {}
}
