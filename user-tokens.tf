# This user is used by the Platform Hub to manage the tokens file
resource "aws_iam_user" "tokens" {
  count = var.create_tokens_user ? 1 : 0

  name          = "acp-tokens-${var.environment}"
  force_destroy = true
  tags = merge(
    local.email_tags,
    {
      "key_rotation" = var.key_rotation
    }
  )
}

# This IAM group is to manage permissions for the tokens user
resource "aws_iam_group" "tokens" {
  count = var.create_tokens_user ? 1 : 0

  name = "acp-tokens-${var.environment}"
}

# Attach the above user to the tokens group
resource "aws_iam_group_membership" "tokens" {
  count = var.create_tokens_user ? 1 : 0

  name  = "acp-tokens-${var.environment}"
  group = aws_iam_group.tokens[0].name
  users = [aws_iam_user.tokens[0].name]
}

# Policy used to access the tokens.csv file
data "aws_iam_policy_document" "tokens" {
  statement {
    actions = ["s3:Get*", "s3:Put*"]

    resources = [
      "arn:aws:s3:::${var.kops_state_bucket}/${var.bucket_name_override != "" ? var.bucket_name_override : var.environment}.${var.dns_zone}-assets/master/tokens.csv",
    ]
  }
}

# Policy to allow access to the tokens file
resource "aws_iam_policy" "tokens" {
  count = var.create_tokens_user ? 1 : 0

  name        = "acp-tokens-${var.environment}"
  description = "Policy to manage tokens for the cluster in environment: ${var.environment}"
  policy      = data.aws_iam_policy_document.tokens.json
}

# Attach the policy to the tokens group
resource "aws_iam_group_policy_attachment" "tokens" {
  count = var.create_tokens_user ? 1 : 0

  group      = aws_iam_group.tokens[0].name
  policy_arn = aws_iam_policy.tokens[0].arn
}

module "token_self_serve_access_keys" {
  count  = var.create_tokens_user ? 1 : 0
  source = "git::https://github.com/UKHomeOffice/acp-tf-self-serve-access-keys?ref=v0.1.0"

  user_names = ["acp-tokens-${var.environment}"]
}
