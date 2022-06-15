# Configuration
config {
  disabled_by_default = true
}

# Terraform language rules
# Link: https://github.com/terraform-linters/tflint/tree/master/docs/rules
rule "terraform_module_version" {
  enabled = true
}

rule "terraform_required_providers" {
  enabled = true
}

rule "terraform_required_version" {
  enabled = true
}
