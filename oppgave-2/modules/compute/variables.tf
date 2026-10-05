  variable rg_name {
    type        = string
    description = "Navnet på resource group-en som storage account-en skal ligge i"
  }
variable location {
    type        = string
    description = "Azure-regionen ressursene opprettes i"
}
variable vm_name {
    type        = string
    description = "Navnet på VM-en som skal opprettes"
  }

variable subnet_id {
    type        = string
    description = "ID-en til subnet-en som VM-en skal ligge i"
  }

variable vm_size {
    type        = string
    description = "Størrelsen på VM-en som skal opprettes"
  }

variable tags {
    type        = map(string)
    description = "Tags som skal legges på ressursene"
  }

variable nic_name {
  type        = string
  description = "Navnet på nettverkskortet som skal opprettes"
}

variable admin_username {
  type        = string
  description = "Brukernavnet til administratoren på VM-en"
}

variable admin_ssh_key {
  type        = string
  description = "SSH-nøkkelen til administratoren på VM-en"
}