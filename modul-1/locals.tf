//lokale variabler
locals {
  company = var.company
  project = "${var.company}-${var.project}"

  common_tags = {
    Company     = local.company
    Project     = local.project
    BillingCode = var.billing_code
  }

  tags = {
    Environment = "Production"
    Costcenter  = "IT"
    Owner       = var.owner
  }
}