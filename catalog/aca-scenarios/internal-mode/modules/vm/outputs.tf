output "virtual_machine_id" {
  value = azurerm_linux_virtual_machine.this.id
}

output "virtual_machine_name" {
  value = azurerm_linux_virtual_machine.this.name
}

output "virtual_machine_private_ip" {
  value = azurerm_network_interface.this.private_ip_address
}