variable "domain" {
  description = "Azure deployment domain"
  type        = string
  default     = "prv"
}

variable "workload" {
  description = "Azure deployment workload"
  type        = string
  default     = "fnc"
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
  description = "Vnet Address prefix"
  default     = "10.0"
}

variable "vnet_address_suffix" {
  type        = string
  description = "Vnet Address suffix"
  default     = ".0.0/16"
}

variable "bastion_subnet_address_suffix" {
  type        = string
  description = "Bastion Subnet Address Suffix"
  default     = ".0.0/26"
}

variable "paas_subnet_address_suffix" {
  type        = string
  description = "Platform As a Service Subnet Address Suffix"
  default     = ".0.64/27"
}

variable "func_subnet_address_suffix" {
  type        = string
  description = "Azure Function Premium Plan Subnet Address Suffix"
  default     = ".0.96/27"
}

variable "vm_default_password" {
  type      = string
  default   = "P@ssw0rd123"
  sensitive = true
}