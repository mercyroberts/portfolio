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

variable "github_repo" {
  description = "owner/name of the repo allowed to deploy"
  type        = string
  default     = "mercyroberts/portfolio"
}

variable "budget_email" {
  description = "Where AWS sends cost alerts"
  type        = string
  default     = "robertmercy499@gmail.com"
}
