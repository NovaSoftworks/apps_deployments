resource "azurerm_app_service_managed_certificate" "certificate" {
  custom_hostname_binding_id = azurerm_app_service_custom_hostname_binding.hostname.id
}

resource "azurerm_app_service_certificate_binding" "certificate_binding" {
  hostname_binding_id = azurerm_app_service_custom_hostname_binding.hostname.id
  certificate_id      = azurerm_app_service_managed_certificate.certificate.id
  ssl_state           = "SniEnabled"
}
