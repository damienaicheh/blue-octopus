# resource "azapi_resource" "ms_foundry_microsoft_learn_connection" {
#   type                      = "Microsoft.CognitiveServices/accounts/projects/connections@2025-06-01"
#   name                      = "ai-gateway-microsoft-learn"
#   parent_id                 = azapi_resource.ms_foundry_project.id
#   schema_validation_enabled = false

#   body = {
#     properties = {
#       category      = "RemoteTool"
#       authType      = "ProjectManagedIdentity"
#       audience      = "https://azure-api.net/aigateway"
#       target        = "${local.ai_gateway_url}/default/toolservers/${azapi_resource.ai_gateway_microsoft_learn_mcp.name}/mcp"
#       isSharedToAll = true
#       metadata = {
#         type = "custom_MCP"
#       }
#     }
#   }

#   depends_on = [
#     azurerm_role_assignment.ai_gateway_user_to_foundry_identity,
#     azapi_resource.ai_gateway_microsoft_learn_mcp
#   ]
# }
