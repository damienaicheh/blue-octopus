variable "environment" {
  description = "The environment deployed"
  type        = string
  default     = "dev"
  validation {
    condition     = can(regex("(dev|stg|prd)", var.environment))
    error_message = "The environment value must be a valid."
  }
}

variable "domain" {
  description = "The name of the project's domain"
  type        = string
  default     = "ai"
}

variable "application" {
  type        = string
  default     = "call"
  description = "The application name"
}

variable "location" {
  type        = string
  default     = "eastus2"
  description = "The Azure region where the resources should be created"
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