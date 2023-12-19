output "public_endpoint_url" {
  value = hcp_vault_cluster.hpl-vault.vault_public_endpoint_url
}

output "private_endpoint_url" {
  value = hcp_vault_cluster.hpl-vault.vault_private_endpoint_url
}

output "cluster_id" {
  value = hcp_vault_cluster.hpl-vault.cluster_id
}

output "bootstrap_token" {
  value = hcp_vault_cluster_admin_token.bootstrap.token
  sensitive = true
}