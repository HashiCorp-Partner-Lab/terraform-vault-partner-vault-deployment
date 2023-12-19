variable "hvn_id" {
  type    = string
  default = "partner-hvn"
}

variable "hcp_project_id" {
  type        = string
  description = "The HCP Project in which to deploy artifacts"
  default     = "No Project ID Set"
}

variable "cluster_id" {
  type    = string
  default = "partner-hcp-vault"
}

variable "cloud_provider" {
  type    = string
  default = "aws"
}

variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "tier" {
  type    = string
  default = "plus_small"
}

variable "expose_public_endpoint" {
  type    = bool
  default = true
}