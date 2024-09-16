variable "environment" {
  type        = string
  default     = "dev"
  description = "The environment name"
  validation {
    condition     = can(regex("dev|stag|prod", var.environment))
    error_message = "The environment name value is not valid."
  }
}

variable "domain" {
  type        = string
  default     = "shc"
  description = "The domain name"
}

variable "application" {
  type        = string
  default     = "api"
  description = "The application name"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "The Azure region where the resources should be created"
}

variable "tags" {
  type        = map(any)
  description = "The custom tags for all resources"
  default     = {}
}

variable "vnet_address_prefix" {
  type        = string
  description = "Vnet Address prefix"
  default     = "10.0"
}

variable "vnet_address_suffix" {
  type        = string
  description = "Vnet Address suffix"
  default     = "0.0/16"
}

variable "paas_subnet_address_suffix" {
  type        = string
  description = "Platform as a Service Subnet Address Suffix"
  default     = ".0.0/24"
}

variable "app_service_subnet_address_suffix" {
  type        = string
  description = "Pass Subnet Address Suffix"
  default     = ".1.0/28"
}

variable "app_service_plan_sku" {
  type        = string
  default     = "B1"
  description = "The app service plan SKU"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
  default     = ""
}
