module "vm_spk1" {
  source              = "./modules/vm"
  resource_suffix     = format("%s-%s", "spk1", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  vm_password         = var.vm_default_password
  subnet_id           = azurerm_subnet.subnet_paas_spk1.id
  tags                = local.tags
}

module "vm_spk2" {
  source              = "./modules/vm"
  resource_suffix     = format("%s-%s", "spk2", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  vm_password         = var.vm_default_password
  subnet_id           = azurerm_subnet.subnet_paas_spk2.id
  tags                = local.tags
}

module "vm_spk3" {
  source              = "./modules/vm"
  resource_suffix     = format("%s-%s", "spk3", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  location            = var.location_spk3
  vm_password         = var.vm_default_password
  subnet_id           = azurerm_subnet.subnet_paas_spk3.id
  tags                = local.tags
}