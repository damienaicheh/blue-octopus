variable "resource_suffix" {
  description = "The suffix to append to the resource names"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "tags" {
  type        = map(any)
  description = "The custom tags for all resources"
  default     = {}
}

variable "subnet_id" {
  description = "The ID of the subnet to deploy the bastion host. It must be named 'AzureBastionSubnet' with an address prefix of /26"
  type        = string
}