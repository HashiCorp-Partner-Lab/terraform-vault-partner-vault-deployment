terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.78.0"
    }
  }
}

provider "hcp" {
  project_id = var.hcp_project_id
}