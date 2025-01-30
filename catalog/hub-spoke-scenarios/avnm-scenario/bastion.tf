module "bastion" {
  source              = "./modules/bastion"
  resource_suffix     = local.resource_suffix_kebabcase
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  subnet_id           = azurerm_subnet.subnet_bastion.id
  tags                = local.tags
}