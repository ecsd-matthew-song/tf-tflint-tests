/*
variable "value_1" {
  description = "The is a variable in the wrong file"
  type        = string
}
*/

output "output_1" {
  description = "An output in the wrong location"
  value       = var.value_1
}
