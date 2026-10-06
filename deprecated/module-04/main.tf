terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}


module "resource_group" {
  source    = "./resource-group"
  base_name = "TFDemo"
  location  = "Norway East"
}

module "storage_account" {
  source    = "./storage-account"
  base_name = "TFDemo"
  rg_name   = module.resource_group.rg_name
  location  = "Norway East"
}