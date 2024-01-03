variable "hpl_hcp_hvn_id" {
  type        = string
  description = "The ID of the HVN this HCP Vault cluster is associated to"
  default     = ""
}

variable "hpl_hcp_project_id" {
  type        = string
  description = "The HCP Project in which to deploy artifacts"
  default     = ""
}

variable "hpl_hcp_project_name" {
  type        = string
  description = "The HCP Project name"
  default     = ""
}

variable "cluster_id_suffix" {
  type        = string
  description = "The ID suffix of the HCP Vault cluster"
  default     = "vault-1"
}

variable "tier" {
  type        = string
  description = "Tier of the HCP Vault cluster"
  default     = "dev"
}

variable "expose_public_endpoint" {
  type        = bool
  description = "Denotes that the cluster has a public endpoint"
  default     = true
}