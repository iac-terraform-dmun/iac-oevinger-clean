//deklarere location
variable "location" {
  description = "The Azure region to deploy resources in"
  type        = string
  //default     = "West Europe"
  //sensitive = true
  //validation {
  //  condition     = length(var.location) > 0
  //}
}

variable "subscription_id" {
  description = "The Azure subscription ID to deploy resources in"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Azure storage account"
  type        = string
}

variable "company" {
  type        = string
  description = "Company name"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "billing_code" {
  type        = string
  description = "Billing code - identifies which department is charged"
}

variable "owner" {
  type        = string
  description = "Contact address for the owner of the resources"
}
