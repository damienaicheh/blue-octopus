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
  default     = "bo"
}

variable "application" {
  type        = string
  default     = "hol"
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

variable "projects" {
  type = map(object({
    name                       = string
    description                = string
    maximum_dev_boxes_per_user = number
    enable_environment_definition = bool
    enable_image_definition        = bool
    env_types                  = list(string)
  }))
  description = "The projects to be added in the Dev Center"
}

variable "environment_catalogs" {
  type = map(object({
    name   = string
    branch = string
    path   = string
    uri    = string
  }))
  description = "The environments catalogs to be added in the Dev Center"
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
  default     = ".0.0/16"
}

variable "dev_boxes_subnet_address_suffix" {
  type        = string
  description = "Dev Boxes Subnet Address suffix"
  default     = ".0.0/24"
}
