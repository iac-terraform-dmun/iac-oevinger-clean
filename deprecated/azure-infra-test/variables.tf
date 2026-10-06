variable "rg_name" {
  type        = string
  description = "Navnet på resource group-en som skal opprettes"
}
variable "location" {
  type        = string
  description = "Azure-regionen ressursene opprettes i"
}
variable "vnet_name" {
  type    = string
  default = "vnet-tf-demo-01"
}

variable "nsg_name" {
  type    = string
  default = "nsg-tf-demo"
}

variable "subnet_name" {
  type    = string
  default = "snet-tf-demo-001"
}

variable "sa_name" {
  type    = string
  default = "sadanisham"
}

variable "mssql_name" {
  type    = string
  default = "sql-dam-90"
}

variable "mssql_db_name" {
  type    = string
  default = "sqldb-dam-90"
}

variable "vmss_name" {
  type    = string
  default = "vmss-dam"
}

variable "sql_admin_password" {
  type        = string
  description = "Administratorpassordet til SQL-serveren"
  sensitive   = true
}

variable "vmss_admin_password" {
  type        = string
  description = "Administratorpassordet til VM-ene i scale set-et"
  sensitive   = true
}
