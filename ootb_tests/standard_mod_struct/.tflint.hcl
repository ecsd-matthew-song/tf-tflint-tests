# Configuration
config {
  disabled_by_default = true
}

# Terraform language rules
# Link: https://github.com/terraform-linters/tflint/tree/master/docs/rules
rule "terraform_standard_module_structure" {
  enabled = true
}
