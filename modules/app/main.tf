locals {
  component = "novacp-${var.environment}-${var.region_short}-apps"
}

resource "azurerm_resource_group" "app_rg" {
  name     = "${local.component}-${var.app_name}-rg"
  location = var.region
}

resource "azurerm_linux_web_app" "app" {
  name                = "${local.component}-${var.app_name}"
  resource_group_name = azurerm_resource_group.app_rg.name
  location            = azurerm_resource_group.app_rg.location
  service_plan_id     = var.app_service_plan_id
  enabled             = var.app_enabled
  https_only          = true

  site_config {
    application_stack {
      docker_image_name        = "portal:0.1.1"
      docker_registry_url      = "https://${var.environment}${var.region_short}novasoftworks.azurecr.io"
      docker_registry_username = var.acr_username
      docker_registry_password = var.acr_password
    }

    minimum_tls_version = "1.2"
  }
}

# DNS

resource "azurerm_app_service_custom_hostname_binding" "hostname" {
  hostname            = var.app_hostname
  app_service_name    = azurerm_linux_web_app.app.name
  resource_group_name = azurerm_resource_group.app_rg.name

  lifecycle {
    ignore_changes = [ssl_state, thumbprint] # managed by azurerm_app_service_certificate_binding
  }
}

# TLS certificate

resource "azurerm_app_service_managed_certificate" "certificate" {
  custom_hostname_binding_id = azurerm_app_service_custom_hostname_binding.hostname.id
}

resource "azurerm_app_service_certificate_binding" "certificate_binding" {
  hostname_binding_id = azurerm_app_service_custom_hostname_binding.hostname.id
  certificate_id      = azurerm_app_service_managed_certificate.certificate.id
  ssl_state           = "SniEnabled"
}
