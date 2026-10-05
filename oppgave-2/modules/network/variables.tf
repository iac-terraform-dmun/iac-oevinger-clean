variable rg_name {
  type        = string
  description = "Navnet på resource group-en som storage account-en skal ligge i"
}

variable location {
  type        = string
  description = "Azure-regionen ressursene opprettes i"
}
variable vnet_name {
  type    = string
  description = "Navnet på VNET-en som skal opprettes" 
}
variable nsg_name {
  type    = string
  description = "Navnet på NSG-en som skal opprettes"
}
variable subnet_name {
  type    = string
  description = "Navnet på subnet-en som skal opprettes"
}
variable tags {
  type        = map(string)
  description = "Tags som skal legges på ressursene"
}
