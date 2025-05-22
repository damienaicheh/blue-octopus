resource "azurerm_key_vault_secret" "self_hosted_gateway_token" {
  name         = "token"
  value        = "TO_DEFINE"
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
