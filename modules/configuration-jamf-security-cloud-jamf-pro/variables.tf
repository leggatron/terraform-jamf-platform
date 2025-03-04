variable "jamfpro_instance_url" {
  type      = string
  sensitive = true
  default   = ""
}

variable "jsc_username" {
  type      = string
  sensitive = true
  default   = ""
}

variable "tje_okta_clientid" {
  type      = string
  sensitive = true
  default   = ""
}

variable "tje_okta_orgdomain" {
  type      = string
  sensitive = true
  default   = ""
}

variable "clientid" {
  type      = string
  sensitive = true
  default   = ""
}

variable "clientsecret" {
  type      = string
  sensitive = true
  default   = ""
}

variable "jamfpro_instance_fqdn" {
  type      = string
  sensitive = true
  default   = ""
}

variable "auth_method" {
  type      = string
  sensitive = true
  default   = ""
}

variable "basic_auth_password" {
  type      = string
  sensitive = true
  default   = ""
}

variable "basic_auth_username" {
  type      = string
  sensitive = true
  default   = ""
}
