variable "domain" {
  description = "Azure deployment domain"
  type        = string
  default     = "shg"
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

variable "apim_sku_name" {
  description = "The API Management SKU name"
  type        = string
  default     = "Developer_1" # Premium_1
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
  default     = ""
}