output "apim_id" {
  value = azapi_resource.apim.id
}

output "apim_gateway_url" {
  value = azapi_resource.apim.output.properties.gatewayUrl
}