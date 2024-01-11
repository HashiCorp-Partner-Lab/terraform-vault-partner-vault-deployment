output "public_endpoint_url" {
  value       = hcp_vault_cluster.partner-hcp-vault-cluster.vault_public_endpoint_url
  description = "The public URL for the Vault cluster"
}

output "cluster_admin_password" {
  value       = random_password.userpass_cluster_admin_password.result
  sensitive   = true
  description = "The password for the cluster-admin account"
}
