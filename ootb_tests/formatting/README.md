# formatting_test

# Description

This test case confirms the following behaviour:
1. locals should be in lowercase
2. variable names should be in lowercase
3. resource names should be in lowercase

## Corresponding rule

1. terraform_naming_convention

## Interaction

Run `tflint` to simulate this test case

## Error msg

```
4 issue(s) found:

Notice: local value name `failed_LOCAL` must match the following format: snake_case (terraform_naming_convention)

  on main.tf line 13:
  13:   failed_LOCAL = "snakecase doesn't accept uppercase letters"

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_naming_convention.md

Notice: local value name `failed-dash-local` must match the following format: snake_case (terraform_naming_convention)

  on main.tf line 14:
  14:   failed-dash-local = "snakecase doesn't accept dashes"

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_naming_convention.md

Notice: resource name `Incorrect-name-with-dash` must match the following format: snake_case (terraform_naming_convention)

  on main.tf line 21:
  21: resource "random_id" "Incorrect-name-with-dash" {

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_naming_convention.md

Notice: variable name `incorrect-var-NAME` must match the following format: snake_case (terraform_naming_convention)

  on main.tf line 30:
  30: variable "incorrect-var-NAME" {

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_naming_convention.md
```
