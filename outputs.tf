output "public_endpoint_url" {
  value       = hcp_vault_cluster.partner-hcp-vault-cluster.vault_public_endpoint_url
  description = "The public URL for the Vault cluster"
}

output "private_endpoint_url" {
  value       = hcp_vault_cluster.partner-hcp-vault-cluster.vault_private_endpoint_url
  description = "The private URL for the Vault cluster"
}

output "cluster_id" {
  value       = hcp_vault_cluster.partner-hcp-vault-cluster.cluster_id
  description = "The ID of the HCP Vault cluster"
}

output "bootstrap_token" {
  value       = hcp_vault_cluster_admin_token.partner-hcp-vault-admin-token.token
  description = "The admin token of this HCP Vault cluster"
  sensitive   = true
}