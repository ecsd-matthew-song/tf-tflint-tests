# standard_mod_struct

# Description

* Terraform outputs should be in `outputs.tf`
  * By extension, variables should be moved to `variables.tf`
* Terraform projects must have the following files:
  * `main.tf`
  * `outputs.tf`
  * `variables.tf`

This test case confirms the following behaviour:
1. Project must have a `main.tf` file
2. Project should contain an empty `variables.tf` (and `outputs.tf`)
3. Outputs should be moved to `outputs.tf` file (and variables to `variables.tf`)

## Corresponding rules

1. terraform_standard_module_structure
2. terraform_standard_module_structure
3. terraform_standard_module_structure

## Interaction

Run `tflint` to simulate this test case. Commenting and uncommenting the `wrong.tf` content will alter the warnings generated.

## Error msg

```
3 issue(s) found:

Warning: Module should include a main.tf file as the primary entrypoint (terraform_standard_module_structure)

  on main.tf line 1:
   (source code not available)

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_standard_module_structure.md

Warning: Module should include an empty variables.tf file (terraform_standard_module_structure)

  on variables.tf line 1:
   (source code not available)

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_standard_module_structure.md

Warning: output "output_1" should be moved from wrong.tf to outputs.tf (terraform_standard_module_structure)

  on wrong.tf line 8:
   8: output "output_1" {

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_standard_module_structure.md
```
