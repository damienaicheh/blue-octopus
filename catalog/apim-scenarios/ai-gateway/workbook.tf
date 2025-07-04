resource "azurerm_application_insights_workbook" "this" {
  name                = random_uuid.workbook_id.result
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  display_name        = "APIM AI Gateway Workbook"
  source_id           = lower(azapi_resource.application_insights.id)
  data_json           = jsonencode(data.template_file.workbook.rendered)

  tags = local.tags
}
