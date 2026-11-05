resource "azurerm_api_management_workspace" "eshop_team" {
  name              = "eshop-team"
  api_management_id = azurerm_api_management.apim_prod.id
  display_name      = "Eshop Team"
  description       = "Workspace for the Eshop team"
}

resource "azurerm_api_management_workspace" "research_team" {
  name              = "research-team"
  api_management_id = azurerm_api_management.apim_prod.id
  display_name      = "Research Team"
  description       = "Workspace for the Research team"
}