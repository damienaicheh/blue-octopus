variable "domain" {
  description = "Azure deployment domain"
  type        = string
  default     = "nwk"
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

variable "location_spk3" {
  description = "Azure deployment location"
  type        = string
  default     = "swedencentral"
}

variable "region" {
  description = "Azure deployment region"
  type        = string
  default     = "eus2"
}

variable "region_spk3" {
  description = "Azure deployment region"
  type        = string
  default     = "swc"
}

variable "tags" {
  type        = map(any)
  description = "The custom tags for all resources"
  default     = {}
}

variable "vnet_hub_address_prefix" {
  type        = string
  description = "Vnet Address prefix"
  default     = "10.0"
}

variable "vnet_dns_address_prefix" {
  type        = string
  description = "Vnet Dns Address prefix"
  default     = "10.1"
}

variable "vnet_spk1_address_prefix" {
  type        = string
  description = "Vnet Spk1 Address prefix"
  default     = "10.10"
}

variable "vnet_spk2_address_prefix" {
  type        = string
  description = "Vnet Spk2 Address prefix"
  default     = "10.20"
}

variable "vnet_spk3_address_prefix" {
  type        = string
  description = "Vnet Spk3 Address prefix"
  default     = "10.30"
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

variable "firewall_subnet_address_suffix" {
  type        = string
  description = "Firewall Subnet Address Suffix"
  default     = ".1.0/24"
}

variable "firewall_management_subnet_address_suffix" {
  type        = string
  description = "Firewall Management Subnet Address Suffix"
  default     = ".2.0/26"
}

variable "dns_inbound_subnet_address_suffix" {
  type        = string
  description = "DNS Inbound Subnet Address Suffix"
  default     = ".0.0/25"
}

variable "dns_outbound_subnet_address_suffix" {
  type        = string
  description = "DNS Outbound Subnet Address Suffix"
  default     = ".0.128/25"
}

variable "paas_subnet_address_suffix" {
  type        = string
  description = "Platform As a Service Subnet Address Suffix"
  default     = ".0.0/24"
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