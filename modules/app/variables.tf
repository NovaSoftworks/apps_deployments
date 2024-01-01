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

variable "app_name" {
  type        = string
  description = "The name of the App to deploy."
}

variable "app_version" {
  type        = string
  description = "The version of the App to deploy."
}

variable "app_hostname" {
  type        = string
  description = "The hostname of the App to deploy."
}

variable "app_enabled" {
  type        = bool
  description = "Whether or not the App should be enabled."
}
