terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.79.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.23.0"
    }
  }
}

provider "hcp" {
  project_id = var.hpl_hcp_project_id
}

provider "vault" {
  address = hcp_vault_cluster.partner-hcp-vault-cluster.vault_public_endpoint_url
  token   = hcp_vault_cluster_admin_token.partner-hcp-vault-admin-token.token
}