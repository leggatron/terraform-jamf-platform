## Define miscellaneous variables
variable "support_files_path_prefix" {
  type    = string
  default = ""
}
variable "jamfpro_instance_url" {
  description = "Jamf Pro Instance name."
  type        = string
  default     = ""
}

variable "jamfpro_auth_method" {
  description = "Jamf Pro Auth Method."
  type        = string
  default     = "oauth2" #basic or oauth2
}

variable "jamfpro_client_id" {
  description = "Jamf Pro Client ID for authentication."
  type        = string
  default     = ""
}

variable "jamfpro_client_secret" {
  description = "Jamf Pro Client Secret for authentication."
  type        = string
  sensitive   = true
  default     = ""
}

## Define Okta-related variables
variable "tje_okta_clientid" {
  type    = string
  default = "0oadb9ke61k2h6JiT1d7"
}

variable "tje_okta_orgdomain" {
  type    = string
  default = ""
}

variable "tje_okta_orgname" {
  type    = string
  default = ""
}

variable "tje_okta_scepdomain" {
  type    = string
  default = ""
}

variable "tje_okta_scepchallenge" {
  type    = string
  default = ""
}
