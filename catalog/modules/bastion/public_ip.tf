resource "azurerm_public_ip" "bastion" {
  name                = format("pip-bas-%s", var.resource_suffix)
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags

  lifecycle {
    # Azure Bastion applies the "FirstPartyUsage = /Unprivileged" ip_tag on its
    # public IP automatically. ip_tags is ForceNew, so ignore it to avoid a
    # spurious recreation of the public IP (and the bastion in cascade).
    ignore_changes = [ip_tags]
  }
}
