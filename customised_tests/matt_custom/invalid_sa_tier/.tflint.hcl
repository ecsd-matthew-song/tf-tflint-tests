# Configuration
config {
    disabled_by_default = true
    plugin_dir = "./.tflint.d/plugins"
}

# Provider plugins

plugin "matt-custom" {
  enabled = true
  source  = "github.com/ecsd-matthew-song/tflint-ruleset-matt-custom"
  version = "0.1.0"

  signing_key = <<-KEY
  -----BEGIN PGP PUBLIC KEY BLOCK-----

  KEY
}

/*
plugin "matt-custom" {
  enabled = true
}
*/

rule "azurerm_resource_missing_tags" {
  enabled = true
  tags = ["Foo", "Bar"]
}

rule "azurerm_storage_account_invalid_account_tier" {
  enabled = true
}

/*
    Project     = var.project_tag
    Owner       = var.owner_tag
    Environment = var.environment_tag
    ManagedBy   = "Terraform"

    */