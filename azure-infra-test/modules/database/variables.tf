variable "sa_name" {
  type        = string
  description = "Navnet på storage account som skal opprettes"
}

variable "rg_name" {
  type        = string
  description = "Navnet på resource group-en som storage account-en skal ligge i"
}
variable "location" {
  type        = string
  description = "Azure-regionen ressursene opprettes i"
}

variable "mssql_name" {
  type        = string
  description = "Navnet på SQL-serveren som skal opprettes"
}

variable "mssql_db_name" {
  type        = string
  description = "Navnet på SQL-databasen som skal opprettes"
}

variable "sql_admin_password" {
  type        = string
  description = "Administratorpassordet til SQL-serveren"
  sensitive   = true
}
