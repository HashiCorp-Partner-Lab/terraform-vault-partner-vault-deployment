output "public_endpoint_url" {
  value = hcp_vault_cluster.partner-hcp-vault-cluster.vault_public_endpoint_url
}

output "private_endpoint_url" {
  value = hcp_vault_cluster.partner-hcp-vault-cluster.vault_private_endpoint_url
}

output "cluster_id" {
  value = hcp_vault_cluster.partner-hcp-vault-cluster.cluster_id
}

output "bootstrap_token" {
  value     = hcp_vault_cluster_admin_token.partner-hcp-vault-admin-token.token
  sensitive = true
}