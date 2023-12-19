resource "hcp_hvn" "hpl-hvn" {
  hvn_id         = var.hvn_id
  cloud_provider = var.cloud_provider
  region         = var.region
  cidr_block     = "172.25.16.0/20"
}

resource "hcp_vault_cluster" "hpl-vault" {
  cluster_id      = var.cluster_id
  hvn_id          = hcp_hvn.hpl-hvn.hvn_id
  tier            = var.tier
  public_endpoint = var.expose_public_endpoint
}

resource "hcp_vault_cluster_admin_token" "bootstrap" {
  cluster_id = var.cluster_id
  depends_on = [ hcp_vault_cluster.hpl-vault ]
}