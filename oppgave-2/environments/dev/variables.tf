variable "company" {
  type        = string
  description = "Navnet på selskapet som eier ressursene"
}
variable "environment" {
  type        = string
  description = "Navnet på miljøet som ressursene opprettes i (f.eks. dev, prod)"
}
variable "owner" {
  type        = string
  description = "Navnet på eieren av ressursene"
}
variable "location" {
  type        = string
  description = "Azure-regionen ressursene opprettes i"
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
  description = "SSH-nøkkelen til administratoren på VM-en"
}