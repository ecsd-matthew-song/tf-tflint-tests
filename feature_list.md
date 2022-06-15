# Out of the box

1.	TFE runs (plans & applies) warnings should be flagged for fixing by developers before reaching TFE
    a.	Note: This depends on the type of warnings. Most Terraform deprecated warnings are supported out of the box
    For terraform specific deprecation warnings, they can be caught with the following example rules:
        terraform_unused_declarations: 	Disallow variables, data sources, and locals that are declared but never used
        terraform_deprecated_index: Disallow legacy dot index syntax
        terraform_deprecated_interpolation: Disallow deprecated (0.11-style) interpolation
2.	Descriptions should be provided for the following:
    a.	Variables
    b.	Outputs

**NEW**
3. Formatting; everything should be in lowercase
    a. Local
    b. Variable names
    c. Resource names

4.	Warnings should be thrown for invalid values being used for Azure resources

**NEW**
5. Specific files should only have specific resources/declarations, eg:
    * Some declarations will be recommended to be moved to their appropriate files, but `tflint` others like `providers` and `resources` won't be checked.
    a. outputs should only be in `outputs.tf`
    b. variables should only be in `variables.tf`
6. Standard file structure: `main.tf`, `outputs.tf` and `variables.tf` are present

7.	Versions should be specified for the following:
    a.	Providers
    b.	Modules
    c.	Terraform

    Terraform rules:
         terraform_module_version: Modules from a terraform registry must specify a version
         terraform_required_providers: Providers must be specified within the required providers section AND there must be a version











# Possible via customisation

1. Specific files should only have specific resources/declarations:
    * Some declarations will be recommended to be moved to their appropriate files, but `tflint` others like `providers` and `resources` won't be checked.
    b. `Local` must be in `local.tf`

2. files should be present:
* locals.tf
data.tf
providers.tf


1. Modules sources must be a repository and not local
    This can be achieved via a custom rule that will look for the following prefix `../*` and `/*`
    Tests need to be done to validate this behaviour and ensure false positives aren't thrown    
2. All resources should have tags
    Possible, though the rule will need to check and maintain a location to draw the tags from.
3. For a given object’s attribute, maintain either a whitelist or blacklist, i.e: If exp == account tier, it must not be == global
4. ~~Standard file structure: main.tf, outputs.tf and variables.tf are present~~ This can be achieved OOTB
    ~~This can be customised to be more suitable for client needs~~ 


# Need further validation

1. Consistency in attribute values
    a.	All attribute values should be stored in local (eg)  
2. Counts should not be used

3. ~~Specific files should only have specific resources/declarations, eg:~~
    ~~a. Data should only have data~~ (Cannot be done reasonably)
    ~~b. Local should only have local~~ (confirmed)
    ~~c. Variables should only have variables~~ This can be achieved OOTB

# Cannot be reasonably achieved

1. Formatting
    a.	Everything should be lowercased
        i. Local
        ii. Variable names
        iii. Resources name
    b. Use underscores for whitespaces
    c. Resource name should not refer to environment (prod, non-prod, test, UAT, etc)

Some of this could be caught by https://github.com/terraform-linters/tflint/blob/master/docs/rules/terraform_naming_convention.md










2. Specifying of providers in resources
    a. Multiple providers should lead to multiple terraform configuration file
3. Specific files should only have specific resources/declarations:
    a. `Data` must be in `data.tf` (There is a lot of additional coding needed within the sdk for tflint and its sdk to support this)