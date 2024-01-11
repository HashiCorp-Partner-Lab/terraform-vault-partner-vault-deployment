variable "hpl_hcp_hvn_id" {
  type        = string
  description = "The ID of the HVN this HCP Vault cluster is associated to"
  default     = null
}

variable "hpl_hcp_project_id" {
  type        = string
  description = "The HCP Project in which to deploy artifacts"
  default     = null
}

variable "hpl_hcp_project_name" {
  type        = string
  description = "The HCP Project name"
  default     = null
}

variable "hpl_tfc_organisation_name" {
  type        = string
  description = "The TFC Organisation name"
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

variable "tfc_hostname" {
  type        = string
  description = "The hostname of the TFC or TFE instance."
  default     = "app.terraform.io"
}

variable "jwt_backend_path" {
  type        = string
  description = "The path at which to mount the jwt auth backend in Vault."
  default     = "jwt"
}

variable "tfc_vault_audience" {
  type        = string
  default     = "vault.workload.identity"
  description = "The audience value to use in run identity tokens"
}

variable "TFC_PROJECT_NAME" {
  type        = string
  description = "The name of the project used in this run."
  default     = null
}

variable "TFC_WORKSPACE_NAME" {
  type        = string
  description = "The name of the workspace used in this run."
  default     = null
}