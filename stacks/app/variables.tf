variable "short_name" {
  type        = string
  description = "Personlig kortnavn som holder ressursnavn unike i delt tenant"
}

variable "environment" {
  type        = string
  description = "Navnet på miljøet stacken tilhører (dev, test, prod)"
}

variable "subnet_key" {
  type        = string
  description = "Navnet på subnettet i nettverks-stacken som nettverkskortet skal plasseres i"
}

variable "state_resource_group_name" {
  type        = string
  description = "Ressursgruppa state-backend-en ligger i"
}

variable "state_storage_account_name" {
  type        = string
  description = "Storage account-et state-filene ligger i"
}

variable "state_container_name" {
  type        = string
  description = "Containeren state-filene ligger i"
}
