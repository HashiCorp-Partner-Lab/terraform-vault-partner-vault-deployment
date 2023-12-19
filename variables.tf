variable "hvn_id" {
  type = string
}

variable "hcp_project_id" {
  type        = string
  description = "The HCP Project in which to deploy artifacts"
}

variable "cluster_id" {
  type = string
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