variable "domain" {
  description = "Azure deployment domain"
  type        = string
  default     = "ctn"
}

variable "workload" {
  description = "Azure deployment workload"
  type        = string
  default     = "ops"
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

variable "paas_subnet_address_suffix" {
  type        = string
  description = "PaaS Subnet Address Suffix"
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

variable "vm_subnet_address_suffix" {
  type        = string
  description = "Virtual Machines Subnet Address Suffix"
  default     = ".1.96/27"
}

variable "app_service_subnet_address_suffix" {
  type        = string
  description = "App Service Subnet Address Suffix"
  default     = ".1.128/26"
}

variable "vm_default_password" {
  type      = string
  default   = "P@ssw0rd123"
  sensitive = true
}

variable "gh_repo_owner" {
  type      = string
  default   = "damienaicheh"
  sensitive = true
}

variable "gh_repo_name" {
  type      = string
  default   = "aca-devops"
  sensitive = true
}
