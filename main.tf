terraform {
  required_version = ">= 0.12"
}

locals {
  email_tags = { for i, email in var.email_addresses : "email${i}" => email }
}

# Provider will inherit from environment variables
data "aws_caller_identity" "current" {
}

data "aws_region" "current" {
}

## Create a IAM policy for restriction address to the group
data "aws_iam_policy_document" "admin_ip_restriction" {
  statement {
    sid       = "IAMIPRestriction"
    actions   = ["*"]
    effect    = "Deny"
    resources = ["*"]

    condition {
      test     = "NotIpAddress"
      values   = var.access_restriction
      variable = "aws:SourceIp"
    }
  }
}

## Create a policy if required
resource "aws_iam_policy" "access_restriction" {
  count = length(var.access_restriction) > 0 ? 1 : 0

  name        = "access-retriction"
  description = "Places a source ip restiction on a resource"
  path        = "/"
  policy      = data.aws_iam_policy_document.admin_ip_restriction.json
}

module "users_self_serve_access_keys" {
  source = "git::https://github.com/UKHomeOffice/acp-tf-self-serve-access-keys?ref=v0.1.0"

  user_names = concat(aws_iam_user.admin.*.name, aws_iam_user.peering.*.name, aws_iam_user.readonly.*.name, aws_iam_user.tokens.*.name, aws_iam_user.tenants_admin.*.name, aws_iam_user.tenants_readonly.*.name)
}
