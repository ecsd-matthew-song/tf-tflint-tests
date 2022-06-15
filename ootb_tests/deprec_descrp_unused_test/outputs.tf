output "random_number" {
  # Missing output description
  # description = "The random number"

  # Deprecated string interpolation
  value = "${random_id.server.id}"
}
