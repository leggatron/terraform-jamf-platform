## Call Terraform provider
terraform {
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = ">= 0.1.5"
    }
    jsc = {
      source  = "danjamf/jsctfprovider"
      version = ">= 0.0.11"
    }
  }
}

resource "jsc_ap" "network_relay" {
  name             = "Network Relay"
  oktaconnectionid = ""
  privateaccess    = true
  threatdefence    = false
  datapolicy       = false
}