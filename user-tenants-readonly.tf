# Create a readonly user
resource "aws_iam_user" "tenants_readonly" {
  count         = var.create_tenants_readonly_user ? 1 : 0
  name          = "drone-acp-readonly-${var.environment}-tenants"
  force_destroy = true
  tags = merge(
    local.email_tags,
    {
      "key_rotation" = var.key_rotation
    }
  )
}

resource "aws_iam_group" "tenants_readonly" {
  count = var.create_tenants_readonly_user ? 1 : 0
  name  = "drone-acp-readonly-${var.environment}-tenants"
}

resource "aws_iam_group_membership" "tenants_readonly" {
  count = var.create_tenants_readonly_user ? 1 : 0
  name  = "drone-acp-readonly-${var.environment}-tenants"
  group = aws_iam_group.tenants_readonly[0].name
  users = [aws_iam_user.tenants_readonly[0].name]
}

resource "aws_iam_group_policy_attachment" "tenants_readonly_restrict" {
  count      = length(var.access_restriction) > 0 && var.create_tenants_readonly_user ? 1 : 0
  group      = aws_iam_group.tenants_readonly[0].name
  policy_arn = aws_iam_policy.access_restriction[0].arn
}

resource "aws_iam_group_policy_attachment" "tenants_readonly" {
  count      = var.create_tenants_readonly_user ? 1 : 0
  group      = aws_iam_group.tenants_readonly[0].name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

# Allow access for terraform to decrypt secrets and create a terraform lock file
data "aws_iam_policy_document" "tenants_readonly_terraform_plan" {
  statement {
    actions = [
      "dynamodb:*",
    ]

    resources = [
      "arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/${var.terraform_tenants_lock_tables}",
    ]
  }

  statement {
    actions = [
      "kms:Decrypt",
      "kms:Encrypt",
      "kms:Get*",
      "kms:List*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "secretsmanager:Get*"
    ]

    resources = [
      "*",
    ]
  }
}

# Policy to allow terraform plan
resource "aws_iam_policy" "tenants_readonly_terraform_plan" {
  count = var.create_tenants_readonly_user ? 1 : 0

  name        = "drone-acp-readonly-terraform-plan-${var.environment}-tenants"
  description = "Allow terraform plan for tenants pipelines"
  policy      = data.aws_iam_policy_document.tenants_readonly_terraform_plan.json
}

# Assign access to run terraform plan to the readonly user group
resource "aws_iam_group_policy_attachment" "tenants_readonly_terraform_plan" {
  count = var.create_tenants_readonly_user ? 1 : 0

  group      = aws_iam_group.tenants_readonly[0].name
  policy_arn = aws_iam_policy.tenants_readonly_terraform_plan[0].arn
}

module "tenant_readonly_self_serve_access_keys" {
  count  = var.create_tenants_readonly_user ? 1 : 0
  source = "git::https://github.com/UKHomeOffice/acp-tf-self-serve-access-keys?ref=v0.1.0"

  user_names = ["drone-acp-readonly-${var.environment}-tenants"]
}
