/*
* # terraform-vault-partner-vault-deployment
* No-Code Terraform Module for Vault cluster deployment
*/

locals {
  cluster_id = join("-", [var.hpl_hcp_project_name, var.cluster_id_suffix])
}

resource "hcp_vault_cluster" "partner-hcp-vault-cluster" {
  cluster_id      = local.cluster_id
  hvn_id          = var.hpl_hcp_hvn_id
  tier            = var.tier
  public_endpoint = var.expose_public_endpoint
}

resource "hcp_vault_cluster_admin_token" "partner-hcp-vault-admin-token" {
  cluster_id = local.cluster_id
  depends_on = [hcp_vault_cluster.partner-hcp-vault-cluster]
}