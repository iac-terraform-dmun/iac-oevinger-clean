locals {
  # Samme navnekonvensjon som i nettverks-stacken: prefikset settes per
  # ressurstype, short_name holder navnene unike i delt tenant.
  name_suffix = lower(format("%s-%s", var.short_name, var.environment))

  # Ingen keep-tag her: miljøene skal kunne ryddes av den nattlige jobben.
  common_tags = {
    environment = var.environment
    owner       = var.short_name
    managedby   = "terraform"
  }

  # Det nettverks-stacken har publisert som outputs.
  nettverk = data.terraform_remote_state.nettverk.outputs
}
