# customised_mod_struct

# Description

* Terraform locals should be in `locals.tf`
* Terraform projects must have the following files:
  * `locals.tf`
  * `data.tf`
  * `providers.tf`

This test case confirms the following behaviour:
1. Project must have a `data.tf` file
2. Locals should be moved to `locals.tf`
3. Project should have a `providers.tf` file

## Corresponding rules

1. terraform_customised_module_structure
2. terraform_customised_module_structure
3. terraform_customised_module_structure

## Interaction

Run `tflint` to simulate this test case. Note the `Reference` needs to be updated

## Error msg

```
3 issue(s) found:

Warning: Module should include an empty data.tf file (terraform_customised_module_structure)

  on data.tf line 1:
   (source code not available)

Reference: Custom rule. No reference available.

Warning: local "local_1" should be moved from main.tf to locals.tf (terraform_customised_module_structure)

  on main.tf line 10:
  10:   local_1 = "1"

Reference: Custom rule. No reference available.

Warning: Module should include an empty providers.tf file (terraform_customised_module_structure)

  on providers.tf line 1:
   (source code not available)

Reference: Custom rule. No reference available.
```
