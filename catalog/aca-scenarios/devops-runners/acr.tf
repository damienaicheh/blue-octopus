resource "azurerm_container_registry" "this" {
  name                          = format("acr%s", local.resource_suffix_lowercase)
  resource_group_name           = local.resource_group_name
  location                      = local.resource_group_location
  sku                           = "Premium"
  admin_enabled                 = true
  public_network_access_enabled = false
  tags                          = local.tags

  identity {
    type = "SystemAssigned"
  }

  # network_rule_set  {
  #   default_action = "Deny"
  #   ip_rule {
  #     action = "Allow"
  #     ip_range = format("${data.http.ip.response_body}/32")
  #   }
  # }
}

data "http" "ip" {
  url = "https://ifconfig.me/ip"
}

output "ip" {
  value = data.http.ip.response_body
}
      # TOKEN=$(az acr login --name $ACR_NAME --expose-token --output tsv --query accessToken)
      # echo "$TOKEN" | docker login $ACR_NAME.azurecr.io -u 00000000-0000-0000-0000-000000000000 --password-stdin
      # docker build -t $ACR_NAME.azurecr.io/gh-runner:latest2 -f Dockerfile.github .
      # docker push $ACR_NAME.azurecr.io/gh-runner:latest2
      # az acr repository list --name $ACR_NAME --output table
# resource "null_resource" "acr_docker_build_push" {
#   provisioner "local-exec" {
#     command     = <<EOT
#       ACR_NAME=${azurerm_container_registry.this.name}
#       az acr build --registry $ACR_NAME --image gh-runner:latestbis https://github.com/damienaicheh/container-apps-ci-cd-runner-tutorial.git

#     EOT
#     interpreter = ["/bin/bash", "-c"]
#   }

#   depends_on = [
#     azurerm_container_registry.this
#   ]
# }
