terraform {
  required_version = ">= 0.14.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">=2.2.2"
    }
  }
}

locals {
  correct_local = [7, 8]
  failed_LOCAL = "snakecase doesn't accept uppercase letters"
  failed-dash-local = "snakecase doesn't accept dashes"
}

resource "random_id" "correct_name" {
  byte_length = "2"
}

resource "random_id" "Incorrect-name-with-dash" {
  byte_length = "2"
}

variable "correct_var_name" {
  description = "This is a correct variable name"
  default = ""
}

variable "incorrect-var-NAME" {
  description = "snakecase doesn't accept dashes or uppercase letters"
  default = ""
}