terraform {
  required_version = ">= 1.0.0"
}

data "local_file" "file_content_1" {
  filename = "${path.module}/README.MD"
}

locals {
  local_1 = "1"
}