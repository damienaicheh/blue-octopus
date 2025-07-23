output "resource_group_name" {
  value = local.resource_group_name
}

output "container_registry_name" {
  value = azurerm_container_registry.this.name
}

output "container_app_weather_mcp_name" {
  value = azurerm_container_app.weather_mcp.name
}