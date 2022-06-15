# ver_test

# Description

This test case confirms the following behaviour:
1. Terraform needs its version to be defined
2. Providers need its version to be defined
3. Modules need its version to be defined

## Corresponding rules

1. terraform_required_version
2. terraform_required_providers
3. terraform_module_version

## Interaction

Run `tflint` to simulate this test case

## Error msg

```
3 issue(s) found:

Warning: terraform "required_version" attribute is required (terraform_required_version)

  on  line 0:
   (source code not available)

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_required_version.md

Warning: Missing version constraint for provider "azurerm" in "required_providers" (terraform_required_providers)

  on main.tf line 13:
  13: provider "azurerm" {

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_required_providers.md

Warning: module "network-security-group" should specify a version (terraform_module_version)

  on main.tf line 29:
  29: module "network-security-group" {

Reference: https://github.com/terraform-linters/tflint/blob/v0.33.1/docs/rules/terraform_module_version.md
```
