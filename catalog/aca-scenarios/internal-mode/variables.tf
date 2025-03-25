variable "domain" {
  description = "Azure deployment domain"
  type        = string
  default     = "ctn"
}

variable "workload" {
  description = "Azure deployment workload"
  type        = string
  default     = "api"
}

variable "environment" {
  description = "The environment deployed"
  type        = string
  default     = "dev"
  validation {
    condition     = can(regex("(dev|stg|pro)", var.environment))
    error_message = "The environment value must be a valid."
  }
}

variable "location" {
  description = "Azure deployment location"
  type        = string
  default     = "eastus2"
}

variable "region" {
  description = "Azure deployment region"
  type        = string
  default     = "eus2"
}

variable "tags" {
  type        = map(any)
  description = "The custom tags for all resources"
  default     = {}
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
  default     = ""
}

variable "vnet_address_prefix" {
  type        = string
  description = "Vnet Spk1 Address prefix"
  default     = "10.10"
}

variable "vnet_address_suffix" {
  type        = string
  description = "Vnet Address suffix"
  default     = ".0.0/16"
}

variable "appgw_subnet_address_suffix" {
  type        = string
  description = "App Gateway Subnet Address Suffix"
  default     = ".0.0/24"
}

variable "bastion_subnet_address_suffix" {
  type        = string
  description = "Bastion Subnet Address Suffix"
  default     = ".1.0/26"
}

variable "container_app_environment_subnet_address_suffix" {
  type        = string
  description = "Azure Container App Environment Subnet Address Suffix"
  default     = ".1.64/27"
}
