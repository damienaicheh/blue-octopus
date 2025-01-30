resource "azurerm_role_assignment" "cognitive_services_open_ai_user" {
  for_each             = toset(local.open_ai_access_users)
  scope                = azurerm_cognitive_account.open_ai_swc.id
  role_definition_name = "Cognitive Services OpenAI User"
  principal_id         = each.value
}

 