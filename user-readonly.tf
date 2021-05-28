# Create a readonly user
resource "aws_iam_user" "readonly" {
  count         = var.create_readonly_user ? 1 : 0
  name          = "acp-readonly-${var.environment}"
  force_destroy = true
}

resource "aws_iam_group" "readonly" {
  count = var.create_readonly_user ? 1 : 0
  name  = "acp-readonly-${var.environment}"
}

resource "aws_iam_group_membership" "readonly" {
  count = var.create_readonly_user ? 1 : 0
  name  = "acp-readonly-${var.environment}"
  group = aws_iam_group.readonly[0].name
  users = [aws_iam_user.readonly[0].name]
}

resource "aws_iam_group_policy_attachment" "readonly_restrict" {
  count      = length(var.access_restriction) > 0 && var.create_readonly_user ? 1 : 0
  group      = aws_iam_group.readonly[0].name
  policy_arn = aws_iam_policy.access_restriction[0].arn
}

resource "aws_iam_group_policy_attachment" "readonly" {
  count      = var.create_readonly_user ? 1 : 0
  group      = aws_iam_group.readonly[0].name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

# Allow access for terraform to decrypt secrets and create a terraform lock file
data "aws_iam_policy_document" "readonly_terraform_plan" {
  statement {
    actions = [
      "dynamodb:*",
    ]

    resources = [
      "arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/${var.terraform_lock_table}",
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
resource "aws_iam_policy" "readonly_terraform_plan" {
  count = var.create_readonly_user ? 1 : 0

  name        = "acp-readonly-terraform-plan-${var.environment}"
  description = "Allow terraform plan"
  policy      = data.aws_iam_policy_document.readonly_terraform_plan.json
}

# Assign access to run terraform plan to the readonly user group
resource "aws_iam_group_policy_attachment" "readonly_terraform_plan" {
  count = var.create_readonly_user ? 1 : 0

  group      = aws_iam_group.readonly[0].name
  policy_arn = aws_iam_policy.readonly_terraform_plan[0].arn
}

