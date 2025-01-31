resource "azurerm_role_assignment" "apim_cognitive_services_openai_user_eus2" {
  scope                = azurerm_cognitive_account.open_ai.id
  role_definition_name = "Cognitive Services OpenAI User"
  principal_id         = azapi_resource.apim.output.identity.principalId
}

resource "azurerm_role_assignment" "apim_cognitive_services_openai_user_swc" {
  scope                = azurerm_cognitive_account.open_ai_swc.id
  role_definition_name = "Cognitive Services OpenAI User"
  principal_id         = azapi_resource.apim.output.identity.principalId
}
