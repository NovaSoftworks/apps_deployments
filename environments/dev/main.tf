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

module "portal" {
  source = "../../modules/app"

  environment  = var.environment
  region       = var.region
  region_short = var.region_short

  app_service_plan_id = data.terraform_remote_state.global.outputs.app_service_plan.id
  app_name            = "portal"
  app_version         = var.portal_version
  app_hostname        = var.portal_hostname
  app_enabled         = var.portal_enabled
}
