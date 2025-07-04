resource "azurerm_role_assignment" "apim_cognitive_services_openai_user" {
  for_each             = local.open_ai_resources
  scope                = azurerm_cognitive_account.open_ai[each.key].id
  role_definition_name = "Cognitive Services OpenAI User"
  principal_id         = azapi_resource.apim.output.identity.principalId
}
