provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Leser nettverks-stackens outputs rett fra state-fila dens. Forutsetter at
# nettverks-stacken er rullet ut, og at den som kjører har lesetilgang til
# hele state-fila. Til forskjell fra backend-blokka er dette en vanlig
# datakilde, så config kan bygges av variabler.
data "terraform_remote_state" "nettverk" {
  backend = "azurerm"

  config = {
    resource_group_name  = var.state_resource_group_name
    storage_account_name = var.state_storage_account_name
    container_name       = var.state_container_name
    key                  = format("%s/nettverk.tfstate", var.environment)
    use_azuread_auth     = true
  }
}

module "compute" {
  source = "../../../modules/compute"

  rg_name        = data.terraform_remote_state.nettverk.outputs.resource_group_name
  location       = data.terraform_remote_state.nettverk.outputs.location
  name_suffix    = local.name_suffix
  vm_size        = var.vm_size
  subnet_id      = data.terraform_remote_state.nettverk.outputs.subnet_ids[var.vm_subnet_key]
  admin_username = var.admin_username
  admin_ssh_key  = var.admin_ssh_key
  tags           = local.common_tags
}
