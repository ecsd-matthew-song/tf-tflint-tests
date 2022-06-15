# Configuration
config {
  disabled_by_default = true
}

# Terraform language rules
# Link: https://github.com/terraform-linters/tflint/tree/master/docs/rules
rule "terraform_naming_convention" {
  enabled = true
  format = "snake_case" # The default value
}
