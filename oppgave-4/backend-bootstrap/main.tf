provider "azurerm" {
  features {}
  storage_use_azuread = true
  subscription_id     = var.subscription_id
}

data "azurerm_client_config" "current" {}

resource "random_string" "suffix" {
  length  = 6
  lower   = true
  upper   = false
  numeric = true
  special = false
}

locals {
  # sttf + kortnavn + 6 tegn. Maks 24 tegn totalt, bare små bokstaver og tall.
  sa_name = substr(lower("sttf${var.short_name}${random_string.suffix.result}"), 0, 24)

  tags = {
    # Den nattlige oppryddingsjobben på den delte tenanten sletter alle
    # ressursgrupper som ikke er merket. Dette er det eneste som holder
    # state-backend-en i live fra dag til dag.
    keep      = "true"
    purpose   = "terraform-backend"
    owner     = var.short_name
    managedby = "terraform"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = format("rg-tfstate-%s", var.short_name)
  location = var.location
  tags     = local.tags
}

resource "azurerm_storage_account" "sa" {
  name                     = local.sa_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "LRS"

  tags = local.tags

  shared_access_key_enabled       = false
  default_to_oauth_authentication = true
  allow_nested_items_to_be_public = false
  min_tls_version                 = "TLS1_2"

  blob_properties {
    versioning_enabled = true

    delete_retention_policy {
      days = 7
    }

    container_delete_retention_policy {
      days = 7
    }
  }

  #lifecycle {
  #  prevent_destroy = true
  #}
}

resource "azurerm_role_assignment" "blob_contributor" {
  scope                = azurerm_storage_account.sa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
  principal_type       = "User"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"

  depends_on = [azurerm_role_assignment.blob_contributor]
}
