## Call Terraform provider
terraform {
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.21.0"
    }
  }
}

resource "jamfpro_computer_extension_attribute" "ea_apns" {
  name                   = "APNS"
  enabled                = true
  input_type             = "SCRIPT"
  data_type              = "STRING"
  inventory_display_type = "EXTENSION_ATTRIBUTES"
  script_contents        = file("${path.module}/support_files/apns-cert-uid.sh")
}

## Create computer extension attributes
resource "jamfpro_computer_extension_attribute" "ea_cis_lvl1_failed_count" {
  name                   = "CIS Level 1 - Failed Results Count"
  input_type             = "SCRIPT"
  enabled                = true
  data_type              = "INTEGER"
  inventory_display_type = "EXTENSION_ATTRIBUTES"
  script_contents        = file("${path.module}/support_files/computer_extension_attributes/compliance-FailedResultsCount.sh")
}
