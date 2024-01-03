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

variable "app_service_plan_id" {
  type        = string
  description = "The ID of the App Service Plan."
}

variable "dns_zone_name" {
  type        = string
  description = "The name of the DNS Zone to use for the App."
}

variable "dns_zone_rg_name" {
  type        = string
  description = "The name of the Resource Group where the DNS Zone is located."
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

variable "app_name" {
  type        = string
  description = "The name of the App to deploy."
}

variable "app_version" {
  type        = string
  description = "The version of the App to deploy."
}

variable "app_subdomain" {
  type        = string
  description = "The subdomain of the App to deploy in the given DNS zone."
}

variable "app_enabled" {
  type        = bool
  description = "Whether or not the App should be enabled."
}
