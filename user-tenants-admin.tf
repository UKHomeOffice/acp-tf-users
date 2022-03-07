# Create an tenants admin user for Drone
resource "aws_iam_user" "tenants_admin" {
  count         = var.create_tenants_admin_user ? 1 : 0
  name          = "drone-acp-admin-${var.environment}-tenants"
  force_destroy = true
  tags = merge(
    local.email_tags,
    {
      "key_rotation" = var.key_rotation
    }
  )
}

# Create an admin group to hold the relevant policies
resource "aws_iam_group" "tenants_admin" {
  count = var.create_tenants_admin_user ? 1 : 0
  name  = "drone-acp-admin-${var.environment}-tenants"
}

resource "aws_iam_group_policy_attachment" "tenants_admin_restrict" {
  count      = length(var.access_restriction) > 0 && var.create_tenants_admin_user ? 1 : 0
  group      = aws_iam_group.tenants_admin[0].name
  policy_arn = aws_iam_policy.access_restriction[0].arn
}

resource "aws_iam_group_policy_attachment" "tenants_admin" {
  count      = var.create_tenants_admin_user ? 1 : 0
  group      = aws_iam_group.tenants_admin[0].name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_membership" "tenants_admin" {
  count = var.create_tenants_admin_user ? 1 : 0
  name  = "drone-acp-admin-${var.environment}-tenants"
  group = aws_iam_group.tenants_admin[0].name
  users = [aws_iam_user.tenants_admin[0].name]
}

module "tenant_admin_self_serve_access_keys" {
  source = "git::https://github.com/UKHomeOffice/acp-tf-self-serve-access-keys?ref=v0.1.0"

  user_names = aws_iam_user.tenants_admin[0].name
}
