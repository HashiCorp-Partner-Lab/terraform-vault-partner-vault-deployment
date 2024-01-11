<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) | 0.79.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 3.23.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcp"></a> [hcp](#provider\_hcp) | 0.79.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.51.1 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.23.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcp_vault_cluster.partner-hcp-vault-cluster](https://registry.terraform.io/providers/hashicorp/hcp/0.79.0/docs/resources/vault_cluster) | resource |
| [hcp_vault_cluster_admin_token.partner-hcp-vault-admin-token](https://registry.terraform.io/providers/hashicorp/hcp/0.79.0/docs/resources/vault_cluster_admin_token) | resource |
| [random_password.userpass_cluster_admin_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [tfe_variable.TFC_VAULT_ADDR](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.TFC_VAULT_AUTH_PATH](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.TFC_VAULT_NAMESPACE](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.TFC_VAULT_PROVIDER_AUTH](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.TFC_VAULT_PROVIDER_AUTH_false](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.TFC_VAULT_RUN_ROLE](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable_set.hcp-vault](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable_set) | resource |
| [vault_auth_backend.userpass](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/auth_backend) | resource |
| [vault_generic_endpoint.userpass_cluster_admin](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/generic_endpoint) | resource |
| [vault_jwt_auth_backend.tfc_jwt](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/jwt_auth_backend) | resource |
| [vault_jwt_auth_backend_role.tfc_role](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/jwt_auth_backend_role) | resource |
| [vault_policy.tfc_policy_kv_write](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/policy) | resource |
| [vault_policy.tfc_policy_manage_acl_policies](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/policy) | resource |
| [vault_policy.tfc_policy_manage_auth_methods](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/policy) | resource |
| [vault_policy.tfc_policy_manage_namespaces](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/policy) | resource |
| [vault_policy.tfc_policy_manage_secrets_engines](https://registry.terraform.io/providers/hashicorp/vault/3.23.0/docs/resources/policy) | resource |
| [tfe_workspace.vault-deployment](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/workspace) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_TFC_PROJECT_NAME"></a> [TFC\_PROJECT\_NAME](#input\_TFC\_PROJECT\_NAME) | The name of the project used in this run. | `string` | `null` | no |
| <a name="input_TFC_WORKSPACE_NAME"></a> [TFC\_WORKSPACE\_NAME](#input\_TFC\_WORKSPACE\_NAME) | The name of the workspace used in this run. | `string` | `null` | no |
| <a name="input_cluster_id_suffix"></a> [cluster\_id\_suffix](#input\_cluster\_id\_suffix) | The ID suffix of the HCP Vault cluster | `string` | `"vault-1"` | no |
| <a name="input_expose_public_endpoint"></a> [expose\_public\_endpoint](#input\_expose\_public\_endpoint) | Denotes that the cluster has a public endpoint | `bool` | `true` | no |
| <a name="input_hpl_hcp_hvn_id"></a> [hpl\_hcp\_hvn\_id](#input\_hpl\_hcp\_hvn\_id) | The ID of the HVN this HCP Vault cluster is associated to | `string` | `null` | no |
| <a name="input_hpl_hcp_project_id"></a> [hpl\_hcp\_project\_id](#input\_hpl\_hcp\_project\_id) | The HCP Project in which to deploy artifacts | `string` | `null` | no |
| <a name="input_hpl_hcp_project_name"></a> [hpl\_hcp\_project\_name](#input\_hpl\_hcp\_project\_name) | The HCP Project name | `string` | `null` | no |
| <a name="input_hpl_tfc_organisation_name"></a> [hpl\_tfc\_organisation\_name](#input\_hpl\_tfc\_organisation\_name) | The TFC Organisation name | `string` | `""` | no |
| <a name="input_jwt_backend_path"></a> [jwt\_backend\_path](#input\_jwt\_backend\_path) | The path at which to mount the jwt auth backend in Vault. | `string` | `"jwt"` | no |
| <a name="input_tfc_hostname"></a> [tfc\_hostname](#input\_tfc\_hostname) | The hostname of the TFC or TFE instance. | `string` | `"app.terraform.io"` | no |
| <a name="input_tfc_vault_audience"></a> [tfc\_vault\_audience](#input\_tfc\_vault\_audience) | The audience value to use in run identity tokens | `string` | `"vault.workload.identity"` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Tier of the HCP Vault cluster | `string` | `"dev"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_admin_password"></a> [cluster\_admin\_password](#output\_cluster\_admin\_password) | The password for the cluster-admin account |
| <a name="output_public_endpoint_url"></a> [public\_endpoint\_url](#output\_public\_endpoint\_url) | The public URL for the Vault cluster |
<!-- END_TF_DOCS -->