#
## Module Outputs
#

output "environment" {
  description = "The environment name for the cluster"
  value       = "${var.environment}"
}

output "dns_zone" {
  description = "The DNS zone for the cluster"
  value       = "${var.dns_zone}"
}

output "user_readonly" {
  description = "The user with readonly access"
  value       = "${aws_iam_user.readonly.*.name}"
}

output "user_tokens" {
  description = "The user with S3 tokens access"
  value       = "${aws_iam_user.tokens.*.name}"
}

output "user_admin" {
  description = "The user with admin access"
  value       = "${aws_iam_user.admin.*.name}"
}
