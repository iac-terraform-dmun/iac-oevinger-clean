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
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "demo" {
  name     = "rg-demo-danisham"
  location = "West Europe"
}

//resource "azurerm_storage_account" "demo" {
name                     = "stdemodanisham"
resource_group_name      = azurerm_resource_group.demo.name
location                 = azurerm_resource_group.demo.location
account_tier             = "Standard"
account_replication_type = "LRS"
//}

variable "subscription_id" {
  type        = string
  description = "The Azure subscription ID to deploy resources in"
}
