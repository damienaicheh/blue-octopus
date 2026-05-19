# =============================================================================
# Azure Bastion + Windows VM for private network access
# =============================================================================

# -----------------------------------------------------------------------------
# Subnets
# -----------------------------------------------------------------------------

resource "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [format("%s.4.0/26", var.vnet_address_prefix)]
}

resource "azurerm_subnet" "vm" {
  name                 = "VmSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [format("%s.3.0/24", var.vnet_address_prefix)]
}

# -----------------------------------------------------------------------------
# Azure Bastion
# -----------------------------------------------------------------------------

resource "azurerm_public_ip" "bastion" {
  name                = format("pip-bastion-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.tags
}

resource "azurerm_bastion_host" "this" {
  name                = format("bastion-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  sku                 = "Standard"
  tags                = local.tags

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.bastion.id
  }
}

# -----------------------------------------------------------------------------
# Windows VM
# -----------------------------------------------------------------------------

resource "azurerm_network_interface" "vm" {
  name                = format("nic-vm-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "this" {
  name                = format("vm-%s", local.resource_suffix_kebabcase)
  computer_name       = format("vm-%s", random_id.resource_group_name_suffix.hex)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  size                = "Standard_D2ads_v5"
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd1234!"
  tags                = local.tags

  network_interface_ids = [
    azurerm_network_interface.vm.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2025-Datacenter"
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_virtual_machine_extension" "vm_extension_windows" {
  name                 = "vm-extension-windows"
  virtual_machine_id   = azurerm_windows_virtual_machine.this.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = jsonencode({
    timestamp = 1
  })

  protected_settings = jsonencode({
    commandToExecute = join(" ", [
      "powershell.exe",
      "-ExecutionPolicy Bypass",
      "-Command",
      "\"[IO.File]::WriteAllBytes('C:\\\\Windows\\\\Temp\\\\jumpbox-setup-cli-tools.ps1',[Convert]::FromBase64String('${filebase64("${path.module}/assets/scripts/jumpbox-setup-cli-tools.ps1")}'));",
      "& 'C:\\\\Windows\\\\Temp\\\\jumpbox-setup-cli-tools.ps1'\"",
    ])
  })
}