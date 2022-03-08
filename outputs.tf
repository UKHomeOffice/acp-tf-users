#
## Module Outputs
#

output "environment" {
  description = "The environment name for the cluster"
  value       = var.environment
}

output "dns_zone" {
  description = "The DNS zone for the cluster"
  value       = var.dns_zone
}

output "user_admin" {
  description = "The user with admin access"
  value       = length(aws_iam_user.admin) > 0 ? aws_iam_user.admin[0].name : null
}

output "user_peering" {
  description = "The user with peering access"
  value       = length(aws_iam_user.peering) > 0 ? aws_iam_user.peering[0].name : null
}

output "user_readonly" {
  description = "The user with readonly access"
  value       = length(aws_iam_user.readonly) > 0 ? aws_iam_user.readonly[0].name : null
}

output "user_tokens" {
  description = "The user with S3 tokens access"
  value       = length(aws_iam_user.tokens) > 0 ? aws_iam_user.tokens[0].name : null
}

output "user_tenants_admin" {
  description = "The user with admin access (used in tenant pipelines)"
  value       = length(aws_iam_user.tenants_admin) > 0 ? aws_iam_user.tenants_admin[0].name : null
}

output "user_tenants_readonly" {
  description = "The user with readonly access (used in tenant pipelines)"
  value       = length(aws_iam_user.tenants_readonly) > 0 ? aws_iam_user.tenants_readonly[0].name : null
}