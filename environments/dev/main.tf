terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.2"
    }
  }
  cloud {
    organization = "NovaSoftworks"
    workspaces {
      name = "apps-deployments-dev"
    }
  }
}

data "terraform_remote_state" "global" {
  backend = "remote"

  config = {
    organization = "NovaSoftworks"
    workspaces = {
      name = "global-infrastructure-dev"
    }
  }
}

provider "azurerm" {
  features {}
}

/** TODO: refactor with new infra
module "portal" {
  source = "../../modules/app"

  environment  = var.environment
  region       = var.region
  region_short = var.region_short

  app_service_plan_id = data.terraform_remote_state.global.outputs.app_service_plan.id
  dns_zone_name       = data.terraform_remote_state.global.outputs.dns_zone_novasoftworks_com.name
  dns_zone_rg_name    = data.terraform_remote_state.global.outputs.dns_zone_novasoftworks_com.resource_group_name
  acr_username        = var.acr_username
  acr_password        = var.acr_password
  app_name            = "portal"
  app_version         = var.portal_version
  app_subdomain       = var.portal_subdomain
  app_enabled         = var.portal_enabled
}
**/
