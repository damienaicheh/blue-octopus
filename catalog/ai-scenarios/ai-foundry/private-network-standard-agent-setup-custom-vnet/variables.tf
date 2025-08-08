variable "domain" {
  description = "Azure deployment domain"
  type        = string
  default     = "prv"
}

variable "workload" {
  description = "Azure deployment workload"
  type        = string
  default     = "agt"
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
  default     = "westus3"
}

variable "region" {
  description = "Azure deployment region"
  type        = string
  default     = "wus3"
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

variable "hosts_agent_subnet_address_suffix" {
  type        = string
  description = "Hosts agent Subnet Address Suffix"
  default     = ".0.0/24"
}

variable "paas_subnet_address_suffix" {
  type        = string
  description = "PaaS Subnet Address Suffix"
  default     = ".1.0/24"
}