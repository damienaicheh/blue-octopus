variable "domain" {
  description = "Azure deployment domain"
  type        = string
  default     = "nt"
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

variable "vnet_spk1_address_prefix" {
  type        = string
  description = "Vnet Spk1 Address prefix"
  default     = "10.10"
}

variable "vnet_address_suffix" {
  type        = string
  description = "Vnet Address suffix"
  default     = ".0.0/16"
}

variable "apim_subnet_address_suffix" {
  type        = string
  description = "Apim Service Subnet Address Suffix"
  default     = ".0.0/24"
}

variable "paas_subnet_address_suffix" {
  type        = string
  description = "PaaS Subnet Address Suffix"
  default     = ".1.0/24"
}

variable "bastion_subnet_address_suffix" {
  type        = string
  description = "Bastion Subnet Address Suffix"
  default     = ".2.0/26"
}

variable "vm_subnet_address_suffix" {
  type        = string
  description = "Virtual Machine Subnet Address Suffix"
  default     = ".3.64/26"
}

variable "vm_default_password" {
  type      = string
  default   = "P@ssw0rd123"
  sensitive = true
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
  default     = ""
}