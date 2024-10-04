variable "resource_suffix" {
  description = "The suffix to append to the resource names"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "tags" {
  type        = map(any)
  description = "The custom tags for all resources"
  default     = {}
}

variable "starter_script" {
  description = "The path to the starter script"
  type        = string
  default     = "scripts/jumpbox-setup-cli-tools.sh"
}

variable "subnet_id" {
  description = "The ID of the subnet to deploy the VM into"
  type        = string
}

variable "vm_size" {
  description = "The size of the VM"
  type        = string
  default     = "Standard_B2s"
}

variable "vm_password" {
  description = "The password for the VM"
  type        = string
}