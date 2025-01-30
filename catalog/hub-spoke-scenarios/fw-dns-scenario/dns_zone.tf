resource "azurerm_private_dns_zone" "contoso_net" {
  name                = "contoso.net"
  resource_group_name = local.resource_group_name
  tags                = local.tags
}

resource "azurerm_private_dns_a_record" "vm_spk1_contoso_net" {
  name                = format("%s", module.vm_spk1.virtual_machine_name)
  zone_name           = azurerm_private_dns_zone.contoso_net.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [module.vm_spk1.virtual_machine_private_ip]
}

resource "azurerm_private_dns_a_record" "vm_spk2_contoso_net" {
  name                = format("%s", module.vm_spk2.virtual_machine_name)
  zone_name           = azurerm_private_dns_zone.contoso_net.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [module.vm_spk2.virtual_machine_private_ip]
}

resource "azurerm_private_dns_a_record" "vm_spk3_contoso_net" {
  name                = format("%s", module.vm_spk3.virtual_machine_name)
  zone_name           = azurerm_private_dns_zone.contoso_net.name
  resource_group_name = local.resource_group_name
  ttl                 = 3600
  records             = [module.vm_spk3.virtual_machine_private_ip]
}
