terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.2.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

output "sa_id" {
  value = azurerm_storage_account.sa.id
}


//lage rg
resource "azurerm_resource_group" "rgsa" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}

//lage storage account
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rgsa.name
  location                 = azurerm_resource_group.rgsa.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}