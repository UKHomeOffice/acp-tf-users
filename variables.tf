variable "access_restriction" {
  description = "An array of ip networks which are permitted to use group permissions"
  default     = []
}

variable "create_admin_user" {
  description = "Create a CI admin user"
  default     = false
}

variable "create_readonly_user" {
  description = "Create a CI readonly user"
  default     = false
}

variable "create_peering_user" {
  description = "Create a user for acp peering permissions"
  default     = false
}

variable "create_tokens_user" {
  description = "Create a user with access to manage a K8s tokens file in S3"
  default     = false
}

variable "bucket_name_override" {
  description = "An override used to override the bucket name"
  default     = ""
}

variable "dns_zone" {
  description = "The Route53 hosting zone for this cluster"
  default     = ""
}

variable "environment" {
  description = "The unique environment being created e.g. dev, production etc"
}

variable "kops_state_bucket" {
  description = "The name of the kops state bucket (required for S3 tokens access)"
  default     = ""
}

variable "terraform_lock_table" {
  description = "The terraform bucket name used for state, required for terraform plan permissions"
  default     = ""
}

