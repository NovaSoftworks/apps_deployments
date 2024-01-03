resource "azurerm_app_service_custom_hostname_binding" "hostname" {
  hostname            = "${var.app_subdomain}.${var.dns_zone_name}"
  app_service_name    = azurerm_linux_web_app.app.name
  resource_group_name = azurerm_resource_group.app_rg.name

  lifecycle {
    ignore_changes = [ssl_state, thumbprint] # managed by azurerm_app_service_certificate_binding
  }
}

resource "azurerm_dns_txt_record" "dns_txt_record" {
  name                = "asuid.${var.app_subdomain}" #
  zone_name           = var.dns_zone_name
  resource_group_name = var.dns_zone_rg_name
  ttl                 = 300

  record {
    value = azurerm_linux_web_app.app.custom_domain_verification_id
  }
}

resource "azurerm_dns_cname_record" "dns_cname_record" {
  name                = var.app_subdomain
  zone_name           = var.dns_zone_name
  resource_group_name = var.dns_zone_rg_name
  ttl                 = 300

  record = azurerm_linux_web_app.app.default_hostname
}
