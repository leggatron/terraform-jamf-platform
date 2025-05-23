## Call Terraform provider
terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
    jsc = {
      source                = "danjamf/jsctfprovider"
      configuration_aliases = [jsc.jsc]
    }
  }
}

resource "jsc_oktaidp" "okta_idp_base_unsupervised" {
  clientid  = var.tje_okta_clientid
  name      = "Okta IDP Integration"
  orgdomain = var.tje_okta_orgdomain
}

resource "jsc_ap" "all_services_unsupervised" {
  name             = "Jamf Connect ZTNA and Protect - Unsupervised ${var.entropy_string}"
  idptype          = "OKTA"
  oktaconnectionid = jsc_oktaidp.okta_idp_base_unsupervised.id
  privateaccess    = true
  threatdefence    = true
  datapolicy       = true
}

resource "jamfpro_smart_mobile_device_group" "unsupervised_devices" {
  name = "Unsupervised Mobile Devices ${var.entropy_string}"

  criteria {
    name        = "Supervised"
    priority    = 0
    search_type = "is"
    value       = "Unsupervised"
  }
  criteria {
    name        = "Serial Number"
    priority    = 1
    search_type = "like"
    value       = "111222333444555"
  }
}

resource "jamfpro_smart_mobile_device_group" "byod" {
  name = "BYOD Mobile Devices ${var.entropy_string}"

  criteria {
    name        = "Serial Number"
    priority    = 0
    search_type = "like"
    value       = ""
  }
  criteria {
    name        = "Serial Number"
    priority    = 1
    search_type = "like"
    value       = "111222333444555"
  }
}

resource "jamfpro_mobile_device_configuration_profile_plist" "all_services_mobile_unsupervised" {
  name               = "Jamf Connect ZTNA + Jamf Protect Threat and Content Control - Mobile (Unsupervised) ${var.entropy_string}"
  description        = "This configuration profile contains all the pieces you'll need to deploy and enforce ZTNA, Network Security, and Content Control. We have also created a Smart Group called 'Unsupervised Mobile Devices' and scoped this configuration profile to it. To finalize scoping and get this onto devices, navigate to Smart Computer Groups, click on the 'Unsupervised Mobile Devices' group and remove the serial number criteria with the 111222333444555 serial number."
  deployment_method  = "Install Automatically"
  level              = "Device Level"
  redeploy_on_update = "Newly Assigned"

  payloads         = jsc_ap.all_services_unsupervised.unsupervisedplist
  payload_validate = false

  scope {
    all_mobile_devices      = false
    all_jss_users           = false
    mobile_device_group_ids = [jamfpro_smart_mobile_device_group.unsupervised_devices.id]
  }
}

resource "jamfpro_mobile_device_configuration_profile_plist" "all_services_mobile_byod" {
  name               = "Jamf Connect ZTNA + Jamf Protect Threat and Content Control - Mobile (BYOD) ${var.entropy_string}"
  description        = "This configuration profile contains all the pieces you'll need to deploy and enforce ZTNA, Network Security, and Content Control. We have also created a Smart Group called 'BYOD Mobile Devices' and scoped this configuration profile to it. To finalize scoping and get this onto devices, navigate to Smart Computer Groups, click on the 'BYOD Mobile Devices' group and remove the serial number criteria with the 111222333444555 serial number."
  deployment_method  = "Install Automatically"
  level              = "Device Level"
  redeploy_on_update = "Newly Assigned"

  payloads         = jsc_ap.all_services_unsupervised.byodplist
  payload_validate = false

  scope {
    all_mobile_devices      = false
    all_jss_users           = false
    mobile_device_group_ids = [jamfpro_smart_mobile_device_group.byod.id]
  }
}
