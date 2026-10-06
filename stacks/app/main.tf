provider "azurerm" {
  features {}
}

# Leser nettverks-stackens outputs rett fra state-fila dens. Forutsetter at
# nettverks-stacken er rullet ut for samme miljø, og at den som kjører har
# lesetilgang til state-fila. Til forskjell fra backend-blokka er dette en
# vanlig datakilde, så config kan bygges av variabler.
data "terraform_remote_state" "nettverk" {
  backend = "azurerm"

  config = {
    resource_group_name  = var.state_resource_group_name
    storage_account_name = var.state_storage_account_name
    container_name       = var.state_container_name
    key                  = format("env/%s/nettverk.tfstate", var.environment)
    use_azuread_auth     = true
  }
}

# Nettverkskortet ligger i ressursgruppa og subnettet nettverks-stacken eier.
# Ingen av de tre verdiene er skrevet inn her; alle kommer over stack-grensa.
resource "azurerm_network_interface" "main" {
  name                = format("nic-%s", local.name_suffix)
  location            = local.nettverk.location
  resource_group_name = local.nettverk.resource_group_name
  tags                = local.common_tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = local.nettverk.subnet_ids[var.subnet_key]
    private_ip_address_allocation = "Dynamic"
  }
}
