resource "azurerm_key_vault_secret" "self_hosted_gateway_token_prod_region_1" {
  name         = "SelfHostedGatewayTokenRegion1"
  value        = "TO_DEFINE_PROD_REGION_1"
  key_vault_id = azurerm_key_vault.this.id

  lifecycle {
    ignore_changes = [
      value
    ]
  }

  depends_on = [
    azurerm_role_assignment.user_key_vault_administrator
  ]
}

resource "azurerm_key_vault_secret" "self_hosted_gateway_token_prod_region_2" {
  name         = "SelfHostedGatewayTokenRegion2"
  value        = "TO_DEFINE_PROD_REGION_2"
  key_vault_id = azurerm_key_vault.this.id

  lifecycle {
    ignore_changes = [
      value
    ]
  }

  depends_on = [
    azurerm_role_assignment.user_key_vault_administrator
  ]
}