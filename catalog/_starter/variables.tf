variable "domain" {
  description = "Azure deployment domain"
  type        = string
  default     = "star"
}

variable "workload" {
  description = "Azure deployment workload"
  type        = string
  default     = "str"
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
  default     = "swedencentral"
}

variable "region" {
  description = "Azure deployment region"
  type        = string
  default     = "swc"
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