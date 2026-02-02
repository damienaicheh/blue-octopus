variable "domain" {
  description = "Azure deployment domain"
  type        = string
  default     = "agt"
}

variable "workload" {
  description = "Azure deployment workload"
  type        = string
  default     = "ai"
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

variable "model_name" {
  description = "The name of the model you want to deploy"
  type        = string
  default     = "gpt-4o"
}

variable "model_format" {
  description = "The provider of your model"
  type        = string
  default     = "OpenAI"
}

variable "model_version" {
  description = "The version of your model"
  type        = string
  default     = "2024-11-20"
}

variable "model_sku_name" {
  description = "The SKU of your model deployment"
  type        = string
  default     = "GlobalStandard"
}

variable "model_capacity" {
  description = "The tokens per minute (TPM) of your model deployment"
  type        = number
  default     = 1
}
