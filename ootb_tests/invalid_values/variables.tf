# Network variables
variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(any)
  default     = ["10.0.0.0/16"]
}

variable "address_prefixes" {
  description = "The address prefixes used in the subnet"
  type        = list(any)
  default     = ["10.0.2.0/24"]
}

# Virtual Machine variables
variable "single_vm_size" {
  description = "The size of the Virtual Machine"
  type        = string
  default     = "Standard_F2"
}

variable "admin_username" {
  description = "The username of the Administrator"
  type        = string
  default     = "adminuser"
}

# General variables
variable "az_region" {
  description = "The Azure region"
  type        = string
  default     = "Southeast Asia"
}

variable "project_tag" {
  description = "The tag for the name/id of the project the resource is associated with. Can also be used in the name of resources. Only alphanumeric character and dashes are allowed"
  type        = string
  default     = "test-proj"
}

variable "owner_tag" {
  description = "Owner tag applied to all resources"
  type        = string
  default     = "tester"
}

variable "environment_tag" {
  description = "Environment tag applied to all resources"
  type        = string
  default     = "DEV"
}
