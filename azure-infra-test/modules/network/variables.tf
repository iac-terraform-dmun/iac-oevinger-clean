variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type    = string
  default = "vnet-tf-danisham-01"
}

variable "nsg_name" {
  type    = string
  default = "nsg-tf-danisham-01"
}

variable "subnet_name" {
  type    = string
  default = "snet-tf-danisham-001"
}