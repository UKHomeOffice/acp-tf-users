variable "access_restriction" {
  description = "An array of ip networks which are permitted to use group permissions"
  type        = list(string)
  default     = []
}

variable "create_admin_user" {
  description = "Create a CI admin user"
  type        = bool
  default     = false
}

variable "create_readonly_user" {
  description = "Create a CI readonly user"
  type        = bool
  default     = false
}

variable "create_peering_user" {
  description = "Create a user for acp peering permissions"
  type        = bool
  default     = false
}

variable "create_tokens_user" {
  description = "Create a user with access to manage a K8s tokens file in S3"
  type        = bool
  default     = false
}

variable "create_tenants_admin_user" {
  description = "Create a CI admin user for tenants pipelines"
  type        = bool
  default     = false
}

variable "create_tenants_readonly_user" {
  description = "Create a CI readonly user for tenants pipelines"
  type        = bool
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

variable "terraform_tenants_lock_tables" {
  description = "A glob for the terraform bucket names used for state, required for terraform plan permissions in tenants pipeline"
  default     = ""
}

