variable "subscription_id" {
  type        = string
  description = "Abonnementet ressursene opprettes i"
}

variable "company" {
  type        = string
  description = "Navnet på selskapet som eier ressursene"
}

variable "short_name" {
  type        = string
  description = "Personlig kortnavn som holder ressursnavn unike i delt tenant"
}

variable "environment" {
  type        = string
  description = "Navnet på miljøet stacken tilhører (dev, prod)"
}

variable "owner" {
  type        = string
  description = "Navnet på eieren av ressursene"
}

variable "vm_size" {
  type        = string
  description = "Størrelsen på VM-en som skal opprettes"
}

variable "admin_username" {
  type        = string
  description = "Brukernavnet til administratoren på VM-en"
}

variable "admin_ssh_key" {
  type        = string
  description = "Offentlig SSH-nøkkel for administratoren på VM-en"
}

variable "vm_subnet_key" {
  type        = string
  description = "Navnet på subnettet i nettverks-stacken som VM-en skal plasseres i"
}

variable "state_resource_group_name" {
  type        = string
  description = "Ressursgruppa state-backend-en ligger i. Genereres fra backend-bootstrap."
}

variable "state_storage_account_name" {
  type        = string
  description = "Storage account-et state-filene ligger i. Genereres fra backend-bootstrap."
}

variable "state_container_name" {
  type        = string
  description = "Containeren state-filene ligger i. Genereres fra backend-bootstrap."
}
