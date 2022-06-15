# deprec_descrp_unused_test

# Description

* Some deprecated behaviours are caught
* Outputs and variables need descriptions
* Unused `providers`, `locals`, `variables` & `data sources` are flagged

This test case confirms the following behaviour:
1. Unused required providers are flagged
2. List items should be accessed using square brackets and not via the deprecated way
3. Outputs need descriptions
4. Interpolation-only expressions, i.e. `"${var.value}"` without any other strings/characters inside are deprecated
5. Unused variables are flagged
6. Unused locals are flagged
7. Unused data sources are flagged
8. Variables need descriptions

## Corresponding rules

1. terraform_unused_required_providers
2. terraform_deprecated_index
3. terraform_documented_outputs
4. terraform_deprecated_interpolation
5. terraform_unused_declarations
6. terraform_unused_declarations
7. terraform_unused_declarations
8. terraform_documented_variables

## Interaction

Run `tflint` to simulate this test case

## Error msg

```
8 issue(s) found:

Warning: provider 'archive' is declared in required_providers but not used by the module (terraform_unused_required_providers)

  on main.tf line 12:
  12:     archive = {
  13:       source  = "hashicorp/archive"
  14:       version = ">=2.2.0"
  15:     }

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_unused_required_providers.md

Warning: List items should be accessed using square brackets (terraform_deprecated_index)

  on main.tf line 26:
  26:   byte_length = local.list.0

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_deprecated_index.md

Notice: `random_number` output has no description (terraform_documented_outputs)

  on outputs.tf line 1:
   1: output "random_number" {

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_documented_outputs.md

Warning: Interpolation-only expressions are deprecated in Terraform v0.12.14 (terraform_deprecated_interpolation)

  on outputs.tf line 6:
   6:   value = "${random_id.server.id}"

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_deprecated_interpolation.md

Warning: variable "unused_1" is declared but not used (terraform_unused_declarations)

  on unused.tf line 2:
   2: variable "unused_1" {

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_unused_declarations.md

Warning: local.unused_2 is declared but not used (terraform_unused_declarations)

  on unused.tf line 9:
   9:   unused_2 = "nil"

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_unused_declarations.md

Warning: data "local_file" "unused_3" is declared but not used (terraform_unused_declarations)

  on unused.tf line 13:
  13: data "local_file" "unused_3" {

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_unused_declarations.md

Notice: `file_name` variable has no description (terraform_documented_variables)

  on variables.tf line 1:
   1: variable "file_name" {

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_documented_variables.md
```
