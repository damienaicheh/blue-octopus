resource "azurerm_network_interface" "this" {
  name                = format("nic-%s", var.resource_suffix)
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  name                = format("vm-%s", var.resource_suffix)
  resource_group_name = var.resource_group_name
  location            = var.location

  admin_username                  = "azureuser"
  admin_password                  = var.vm_password
  disable_password_authentication = false
  size                            = var.vm_size

  network_interface_ids = [
    azurerm_network_interface.this.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  secure_boot_enabled = true
  vtpm_enabled        = true

  # Machines should be configured to periodically check for missing system updates
  patch_mode            = "AutomaticByPlatform"
  patch_assessment_mode = "AutomaticByPlatform"
}

resource "azurerm_virtual_machine_extension" "vm_extension_linux" {
  name                 = "vm-extension-linux"
  virtual_machine_id   = azurerm_linux_virtual_machine.this.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"
  settings             = <<SETTINGS
    {
      "script": "${filebase64("${path.module}/${var.starter_script}")}"
    }
SETTINGS
}
