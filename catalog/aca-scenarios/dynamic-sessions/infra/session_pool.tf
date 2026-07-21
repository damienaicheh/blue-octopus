resource "azapi_resource" "dynamic_session_pool" {
  type                      = "Microsoft.App/sessionPools@2025-10-02-preview"
  parent_id                 = local.resource_group_id
  name                      = format("sp%s", local.resource_suffix_lowercase)
  location                  = local.resource_group_location
  tags                      = local.tags_azapi
  schema_validation_enabled = true

  identity {
    identity_ids = []
    type         = "None"
  }
  
  body = {
    properties = {
      containerType = "PythonLTS"
      dynamicPoolConfiguration = {
        lifecycleConfiguration = {
          cooldownPeriodInSeconds = 300
          lifecycleType           = "Timed"
        }
      }
      environmentId           = null
      managedIdentitySettings = []
      mcpServerSettings       = {}
      poolManagementType      = "Dynamic"
      scaleConfiguration = {
        maxConcurrentSessions = 100
      }
      sessionNetworkConfiguration = {
        status = "EgressDisabled"
      }
    }
  }
}
