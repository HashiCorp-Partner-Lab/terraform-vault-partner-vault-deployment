# Create a Global Variable Set with HCP Vault Variables

resource "tfe_variable_set" "hcp-vault" {
  name         = "HCP Vault - Dynamic Provider Credential Config"
  description  = "HCP Vault config required by HashiCorp Partner Lab modules and resources. DO NOT DELETE."
  global       = true
  organization = var.hpl_tfc_organisation_name
}

resource "tfe_variable" "TFC_VAULT_PROVIDER_AUTH" {
  key             = "TFC_VAULT_PROVIDER_AUTH"
  value           = true
  category        = "env"
  description     = "Set to true to enable Vault Dynamic Provider Credentials."
  variable_set_id = tfe_variable_set.hcp-vault.id
}

resource "tfe_variable" "TFC_VAULT_ADDR" {
  key             = "TFC_VAULT_ADDR"
  value           = hcp_vault_cluster.partner-hcp-vault-cluster.vault_public_endpoint_url
  category        = "env"
  description     = "The address of the Vault instance to authenticate against."
  variable_set_id = tfe_variable_set.hcp-vault.id
}

resource "tfe_variable" "TFC_VAULT_NAMESPACE" {
  key             = "TFC_VAULT_NAMESPACE"
  value           = "admin"
  category        = "env"
  description     = "The namespace to use when authenticating to Vault."
  variable_set_id = tfe_variable_set.hcp-vault.id
}

resource "tfe_variable" "TFC_VAULT_RUN_ROLE" {
  key             = "TFC_VAULT_RUN_ROLE"
  value           = vault_jwt_auth_backend_role.tfc_role.role_name
  category        = "env"
  description     = "The name of the Vault role to authenticate against."
  variable_set_id = tfe_variable_set.hcp-vault.id
}

resource "tfe_variable" "TFC_VAULT_AUTH_PATH" {
  key             = "TFC_VAULT_AUTH_PATH"
  value           = vault_jwt_auth_backend.tfc_jwt.path
  category        = "env"
  description     = "The path where the JWT auth backend is mounted in Vault."
  variable_set_id = tfe_variable_set.hcp-vault.id
}

resource "tfe_variable" "vault_public_endpoint_url" {
  key             = "vault_public_endpoint_url"
  value           = hcp_vault_cluster.partner-hcp-vault-cluster.vault_public_endpoint_url
  category        = "terraform"
  description     = "The address of the Vault instance."
  variable_set_id = tfe_variable_set.hcp-vault.id
}

# Create an exclusion for this Vault Deployment Workspace

resource "tfe_variable" "TFC_VAULT_PROVIDER_AUTH_false" {
  key          = "TFC_VAULT_PROVIDER_AUTH"
  value        = false
  category     = "env"
  description  = "Set to false to disable Vault Dynamic Provider Credentials."
  workspace_id = data.tfe_workspace.vault-deployment.id
}
