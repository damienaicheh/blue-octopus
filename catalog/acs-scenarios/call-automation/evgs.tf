# resource "azurerm_eventgrid_event_subscription" "this" {
#   name  = format("evgs-%s", local.resource_suffix_kebabcase)
#   scope = local.resource_group_id

#     webhook_endpoint {
#         url = "https://cpj6pl8w-8080.uks1.devtunnels.ms"
#     }
# }

# resource "azurerm_eventgrid_system_topic" "res-0" {
#   location               = "global"
#   name                   = "system-topic-call-entering"
#   resource_group_name    = "rg-dev-ea-ai-cal-eafd"
#   source_arm_resource_id = "/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-ea-ai-cal-eafd/providers/Microsoft.Communication/CommunicationServices/acs-dev-ea-ai-cal-eafd"
#   tags                   = {}
#   topic_type             = "Microsoft.Communication.CommunicationServices"
# }
