resource "azurerm_network_manager" "this" {
  name                = format("vnm-%s", local.resource_suffix_kebabcase)
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  scope {
    subscription_ids = [data.azurerm_subscription.current.id]
  }
  scope_accesses = ["Connectivity"]
  description    = "Virtual Network Manager for the Azure Virtual Network Module"
  tags           = local.tags
}

resource "azurerm_network_manager_network_group" "all_spokes" {
  name               = "all-spokes"
  network_manager_id = azurerm_network_manager.this.id
  description        = "All Spokes to connect to the Hub"
}

resource "azurerm_network_manager_static_member" "spk1" {
  name                      = "spk1"
  network_group_id          = azurerm_network_manager_network_group.all_spokes.id
  target_virtual_network_id = azurerm_virtual_network.spk1.id
}

resource "azurerm_network_manager_static_member" "spk2" {
  name                      = "spk2"
  network_group_id          = azurerm_network_manager_network_group.all_spokes.id
  target_virtual_network_id = azurerm_virtual_network.spk2.id
}

resource "azurerm_network_manager_static_member" "spk3" {
  name                      = "spk3"
  network_group_id          = azurerm_network_manager_network_group.all_spokes.id
  target_virtual_network_id = azurerm_virtual_network.spk3.id
}

resource "azurerm_network_manager_connectivity_configuration" "this" {
  name                  = "hub-conn-configuration"
  network_manager_id    = azurerm_network_manager.this.id
  connectivity_topology = "HubAndSpoke"

  applies_to_group {
    group_connectivity  = "DirectlyConnected"
    network_group_id    = azurerm_network_manager_network_group.all_spokes.id
    global_mesh_enabled = true
    use_hub_gateway     = false # This is set to false because the hub does not have a gateway in this scenario
  }

  hub {
    resource_id   = azurerm_virtual_network.hub.id
    resource_type = "Microsoft.Network/virtualNetworks"
  }
}

resource "azurerm_network_manager_deployment" "commit_deployment_eastus2" {
  network_manager_id = azurerm_network_manager.this.id
  location           = local.resource_group_location
  scope_access       = "Connectivity"
  configuration_ids  = [azurerm_network_manager_connectivity_configuration.this.id]
}

resource "azurerm_network_manager_deployment" "commit_deployment_swedencentral" {
  network_manager_id = azurerm_network_manager.this.id
  location           = "swedencentral"
  scope_access       = "Connectivity"
  configuration_ids  = [azurerm_network_manager_connectivity_configuration.this.id]
}
