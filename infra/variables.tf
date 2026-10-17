variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "aws_profile" {
  type    = string
  default = "iamadmin-prod"
}

variable "domain" {
  type    = string
  default = "mercyrobert.dev"
}

# GitHub's immutable OIDC subject: owner@owner_id/repo@repo_id. The IDs stop a
# deleted and re-created repo with the same name from inheriting access.
variable "github_repo" {
  description = "Repo allowed to deploy, as GitHub writes it in the OIDC subject"
  type        = string
  default     = "mercyroberts@76105163/portfolio@1423336542"
}

variable "budget_email" {
  description = "Where AWS sends cost alerts"
  type        = string
  default     = "robertmercy499@gmail.com"
}
