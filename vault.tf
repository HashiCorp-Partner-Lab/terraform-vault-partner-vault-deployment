# Enable the Userpass auth method and create a user for cluster administration

resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "random_password" "userpass_cluster_admin_password" {
  length = 32
}

resource "vault_generic_endpoint" "userpass_cluster_admin" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/cluster-admin"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["hcp-root"],
  "password": "${random_password.userpass_cluster_admin_password.result}"
}
EOT
}

# Enable the JWT auth method to use with TFC

resource "vault_jwt_auth_backend" "tfc_jwt" {
  path               = var.jwt_backend_path
  type               = "jwt"
  oidc_discovery_url = "https://${var.tfc_hostname}"
  bound_issuer       = "https://${var.tfc_hostname}"
}

resource "vault_jwt_auth_backend_role" "tfc_role" {
  backend   = vault_jwt_auth_backend.tfc_jwt.path
  role_name = "tfc-role"
  token_policies = [vault_policy.tfc_policy_manage_namespaces.name,
    vault_policy.tfc_policy_manage_secrets_engines.name,
    vault_policy.tfc_policy_kv_write.name,
    vault_policy.tfc_policy_manage_acl_policies.name,
  vault_policy.tfc_policy_manage_auth_methods.name]

  bound_audiences   = [var.tfc_vault_audience]
  bound_claims_type = "glob"
  bound_claims = {
    sub = "organization:${var.hpl_tfc_organisation_name}:project:*:workspace:*:run_phase:*"
  }

  claim_mappings = {
    "terraform_workspace_name" = "terraform_workspace_name"
  }

  user_claim = "terraform_full_workspace"
  role_type  = "jwt"
  token_ttl  = 1200
}

# Create polices to be used with TFC

resource "vault_policy" "tfc_policy_manage_namespaces" {
  name = "manage-namespaces"

  policy = <<EOT
# Allow management of namespaces to match TFC Workspace name
path "sys/namespaces/{{identity.entity.aliases.${vault_jwt_auth_backend.tfc_jwt.accessor}.metadata.terraform_workspace_name}}" {
  capabilities = ["create", "update", "read", "delete"]
}
EOT
}

resource "vault_policy" "tfc_policy_manage_secrets_engines" {
  name = "manage-secrets-engines"

  policy = <<EOT
# Allow management of secrets engines in child namespace
path "{{identity.entity.aliases.${vault_jwt_auth_backend.tfc_jwt.accessor}.metadata.terraform_workspace_name}}/sys/mounts/secrets" {
  capabilities = ["create", "update", "read", "delete"]
}
path "{{identity.entity.aliases.${vault_jwt_auth_backend.tfc_jwt.accessor}.metadata.terraform_workspace_name}}/sys/mounts" {
  capabilities = ["read"]
}
EOT
}

resource "vault_policy" "tfc_policy_kv_write" {
  name = "kv-write"

  policy = <<EOT
# Allow write access to KV secrets engine 
path "{{identity.entity.aliases.${vault_jwt_auth_backend.tfc_jwt.accessor}.metadata.terraform_workspace_name}}/secrets/+/my-first-secret" {
  capabilities = ["create", "update", "read", "delete"]
}
EOT
}

resource "vault_policy" "tfc_policy_manage_acl_policies" {
  name = "manage-acl-policies"

  policy = <<EOT
# Allow management of ACL policies in child namespace
path "{{identity.entity.aliases.${vault_jwt_auth_backend.tfc_jwt.accessor}.metadata.terraform_workspace_name}}/sys/policies/acl/*" {
  capabilities = ["create", "update", "read", "delete"]
}
EOT
}

resource "vault_policy" "tfc_policy_manage_auth_methods" {
  name = "manage-auth-methods"

  policy = <<EOT
# Allow management of auth methods in child namespace
path "{{identity.entity.aliases.${vault_jwt_auth_backend.tfc_jwt.accessor}.metadata.terraform_workspace_name}}/sys/auth/jwt" {
  capabilities = ["create", "update", "read", "delete", "sudo"]
}
path "{{identity.entity.aliases.${vault_jwt_auth_backend.tfc_jwt.accessor}.metadata.terraform_workspace_name}}/sys/mounts/auth/jwt/tune" {
  capabilities = ["read"]
}
path "{{identity.entity.aliases.${vault_jwt_auth_backend.tfc_jwt.accessor}.metadata.terraform_workspace_name}}/sys/auth/userpass" {
  capabilities = ["create", "update", "read", "delete", "sudo"]
}
path "{{identity.entity.aliases.${vault_jwt_auth_backend.tfc_jwt.accessor}.metadata.terraform_workspace_name}}/sys/auth" {
  capabilities = ["read"]
}
path "{{identity.entity.aliases.${vault_jwt_auth_backend.tfc_jwt.accessor}.metadata.terraform_workspace_name}}/auth/jwt/config" {
  capabilities = ["create", "update", "read"]
}
path "{{identity.entity.aliases.${vault_jwt_auth_backend.tfc_jwt.accessor}.metadata.terraform_workspace_name}}/auth/jwt/role/tfc-role" {
  capabilities = ["create", "update", "read", "delete"]
}
path "{{identity.entity.aliases.${vault_jwt_auth_backend.tfc_jwt.accessor}.metadata.terraform_workspace_name}}/auth/userpass/users/namespace-admin" {
  capabilities = ["create", "update", "read", "delete"]
}
EOT
}