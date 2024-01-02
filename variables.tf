variable "hpl_hcp_hvn_id" {
  type    = string
  description = "The ID of the HVN this HCP Vault cluster is associated to"
  default = ""
}

variable "hpl_hcp_project_id" {
  type        = string
  description = "The HCP Project in which to deploy artifacts"
  default     = ""
}

variable "cluster_id" {
  type    = string
  description = "The ID of the HCP Vault cluster"
  default = "partner-hcp-vault"
}

variable "tier" {
  type    = string
  description = "Tier of the HCP Vault cluster"
  default = "plus_small"
}

variable "expose_public_endpoint" {
  type    = bool
  description = "Denotes that the cluster has a public endpoint"
  default = true
}