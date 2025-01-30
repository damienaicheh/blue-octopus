output "azurerm_bastion_host_name" {
  value = azurerm_bastion_host.this.name
}

output "azurerm_bastion_host_public_ip" {
  value = azurerm_public_ip.bastion.ip_address
}