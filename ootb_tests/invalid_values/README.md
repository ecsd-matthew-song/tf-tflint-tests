# invalid_values

# Description

This test case confirms the following behaviour:
1. Invalid value for sku for Azure Public IP
2. Invalid value for size for Azure linux virtual machine

## Corresponding rules

1. azurerm_public_ip_invalid_sku
2. azurerm_linux_virtual_machine_invalid_size

## Interaction

Run `tflint` to simulate this test case

## Error msg

```
2 issue(s) found:

Error: "..." is an invalid value as sku (azurerm_public_ip_invalid_sku)

  on main.tf line 76:
  76:   sku = "..."

Reference: https://github.com/terraform-linters/tflint-ruleset-azurerm/blob/v0.14.0/docs/rules/azurerm_public_ip_invalid_sku.md

Error: "Standard_F23" is an invalid value as size (azurerm_linux_virtual_machine_invalid_size)

  on main.tf line 91:
  91:   size                = var.single_vm_size

Reference: https://github.com/terraform-linters/tflint-ruleset-azurerm/blob/v0.14.0/docs/rules/azurerm_linux_virtual_machine_invalid_size.md
```
