# Lookup the current workspace details

data "tfe_workspace" "vault-deployment" {
  name         = var.TFC_WORKSPACE_NAME
  organization = var.hpl_tfc_organisation_name
}