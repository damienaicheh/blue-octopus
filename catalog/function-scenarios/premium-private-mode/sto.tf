resource "azurerm_storage_account" "this" {
  name                             = format("stfunc%s", local.resource_suffix_lowercase)
  resource_group_name              = local.resource_group_name
  location                         = local.resource_group_location
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  tags                             = var.tags
  cross_tenant_replication_enabled = false
  allow_nested_items_to_be_public  = false
  default_to_oauth_authentication  = true
  public_network_access_enabled    = true

  network_rules {
    bypass                     = ["AzureServices"]
    default_action             = "Deny"
    ip_rules                   = ["${jsondecode(data.http.ipinfo.response_body).ip}"]
    virtual_network_subnet_ids = []
  }
}

resource "azurerm_storage_share" "func_storage" {
  name               = format("func-%s", local.resource_suffix_kebabcase)
  storage_account_id = azurerm_storage_account.this.id
  quota              = 50
}