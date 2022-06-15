terraform {
  required_version = ">= 0.14.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">=2.2.2"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.1.3"
    }
    archive = {
      source  = "hashicorp/archive"
      version = ">=2.2.0"
    }
  }
}

locals {
  list = [7, 8]
}

resource "random_id" "server" {
  # Deprecated index reference
  # byte_length = local.list[0] # Proper reference
  byte_length = local.list.0
}
