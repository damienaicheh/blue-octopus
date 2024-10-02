module "vm_spk1" {
  source              = "./../../modules/vm"
  resource_suffix     = format("%s-%s", "spk1", local.resource_suffix_kebabcase)
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  vm_password         = var.vm_default_password
  subnet_id           = azurerm_subnet.subnet_apim_spk1.id
  tags                = local.tags
}