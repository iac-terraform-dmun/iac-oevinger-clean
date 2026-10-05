variable "location" {
  description = "Azure region in which to create the backend resources."
  type        = string
  default     = "northeurope"

  validation {
    condition     = contains(["northeurope", "uksouth", "westeurope", "norwayeast", "norwaywest"], var.location)
    error_message = "location må være en av de tillatte regionene i tenanten."
  }
}

variable "short_name" {
  description = "Short name used for naming resources."
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription ID where the resources will be created."
  type        = string
}
