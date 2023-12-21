terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.78.0"
    }
  }
}

provider "hcp" {
  project_id = var.hpl_hcp_project_id
}