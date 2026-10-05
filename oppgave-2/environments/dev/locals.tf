locals {
  name_suffix = lower(format("%s-%s", var.company, var.environment))

  common_tags = {
    environment = var.environment
    owner       = var.owner
    managedby   = "terraform"
  }
}