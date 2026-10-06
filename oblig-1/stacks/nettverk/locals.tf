locals {
  # Miljøet leverer bestanddelene; modulene setter på prefikset som gjelder
  # for sin egen ressurstype. short_name holder navnene unike i delt tenant.
  name_suffix = lower(format("%s-%s", var.short_name, var.environment))

  # Ingen keep-tag her: miljøene skal kunne ryddes av den nattlige jobben.
  common_tags = {
    environment = var.environment
    owner       = var.short_name
    managedby   = "terraform"
  }
}
