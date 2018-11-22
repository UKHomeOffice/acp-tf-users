# Provider will inherit from environment variables
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

## Create a IAM policy for restriction address to the group
data "aws_iam_policy_document" "admin_ip_restriction" {
  statement {
    sid       = "IAMIPRestriction"
    actions   = ["*"]
    effect    = "Deny"
    resources = ["*"]

    condition {
      test     = "NotIpAddress"
      values   = ["${var.access_restriction}"]
      variable = "aws:SourceIp"
    }
  }
}
