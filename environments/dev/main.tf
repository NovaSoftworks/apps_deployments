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
