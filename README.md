# terraform-vault-partner-vault-deployment
No-Code Terraform Module for Vault cluster deployment

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) | 0.78.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcp"></a> [hcp](#provider\_hcp) | 0.78.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcp_vault_cluster.partner-hcp-vault-cluster](https://registry.terraform.io/providers/hashicorp/hcp/0.78.0/docs/resources/vault_cluster) | resource |
| [hcp_vault_cluster_admin_token.partner-hcp-vault-admin-token](https://registry.terraform.io/providers/hashicorp/hcp/0.78.0/docs/resources/vault_cluster_admin_token) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id_suffix"></a> [cluster\_id\_suffix](#input\_cluster\_id\_suffix) | The ID suffix of the HCP Vault cluster | `string` | `"vault-1"` | no |
| <a name="input_expose_public_endpoint"></a> [expose\_public\_endpoint](#input\_expose\_public\_endpoint) | Denotes that the cluster has a public endpoint | `bool` | `true` | no |
| <a name="input_hpl_hcp_hvn_id"></a> [hpl\_hcp\_hvn\_id](#input\_hpl\_hcp\_hvn\_id) | The ID of the HVN this HCP Vault cluster is associated to | `string` | `""` | no |
| <a name="input_hpl_hcp_project_id"></a> [hpl\_hcp\_project\_id](#input\_hpl\_hcp\_project\_id) | The HCP Project in which to deploy artifacts | `string` | `""` | no |
| <a name="input_hpl_hcp_project_name"></a> [hpl\_hcp\_project\_name](#input\_hpl\_hcp\_project\_name) | The HCP Project name | `string` | `""` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Tier of the HCP Vault cluster | `string` | `"dev"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bootstrap_token"></a> [bootstrap\_token](#output\_bootstrap\_token) | The admin token of this HCP Vault cluster |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The ID of the HCP Vault cluster |
| <a name="output_private_endpoint_url"></a> [private\_endpoint\_url](#output\_private\_endpoint\_url) | The private URL for the Vault cluster |
| <a name="output_public_endpoint_url"></a> [public\_endpoint\_url](#output\_public\_endpoint\_url) | The public URL for the Vault cluster |
