# This variable is not used
variable "unused_1" {
  description = "An unused variable"
  # type = string
}

# An unused local value
locals {
  unused_2 = "nil"
}

# An unused data source
data "local_file" "unused_3" {
  filename = "${path.module}/${var.file_name}"
}