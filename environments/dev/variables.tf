variable "environment" {
  type        = string
  description = "This is the environment where the infrastructure will be deployed."
}

variable "region" {
  type        = string
  description = "This is the cloud hosting region the infrastructure will be deployed."
}

variable "region_short" {
  type        = string
  description = "This is the cloud hosting region where the infrastructure will be deployed, but shortened."
}

variable "acr_username" {
  type        = string
  description = "The username for the Docker Registry."
}

variable "acr_password" {
  type        = string
  description = "The password for the Docker Registry."
  sensitive   = true
}

variable "portal_version" {
  type        = string
  description = "The version of the Portal app to deploy."
}

variable "portal_hostname" {
  type        = string
  description = "The hostname of the Portal app to deploy."
}

variable "portal_enabled" {
  type        = bool
  description = "Whether or not the Portal app should be enabled."
}
