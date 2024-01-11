# Generate a Cluster ID based on the HCP Project Name and a suffix

locals {
  cluster_id = join("-", [var.hpl_hcp_project_name, var.cluster_id_suffix])
}

# Provision a HCP Vault Cluster

resource "hcp_vault_cluster" "partner-hcp-vault-cluster" {
  cluster_id      = local.cluster_id
  hvn_id          = var.hpl_hcp_hvn_id
  tier            = var.tier
  public_endpoint = var.expose_public_endpoint
}

# Generate a HCP Vault admin token for intial bootstrapping

resource "hcp_vault_cluster_admin_token" "partner-hcp-vault-admin-token" {
  cluster_id = hcp_vault_cluster.partner-hcp-vault-cluster.cluster_id
}