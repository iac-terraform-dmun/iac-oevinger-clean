locals {
  # Miljøet leverer bestanddelene; modulene setter på prefikset som gjelder
  # for sin egen ressurstype. short_name holder navnene unike i delt tenant.
  name_suffix = lower(format("%s-%s-%s", var.company, var.short_name, var.environment))

  common_tags = {
    environment = var.environment
    owner       = var.owner
    managedby   = "terraform"
  }
}
