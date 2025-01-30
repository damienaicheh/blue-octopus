resource "azurerm_cognitive_account" "this" {
  name                = format("di-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  kind                = "FormRecognizer"

  sku_name = "S0"

  tags = local.tags
}
