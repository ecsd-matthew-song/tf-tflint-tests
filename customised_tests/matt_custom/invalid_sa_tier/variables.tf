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
