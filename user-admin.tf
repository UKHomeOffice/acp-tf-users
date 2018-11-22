# Create an admin user
resource "aws_iam_user" "admin" {
  count         = "${var.create_admin_user ? 1 : 0}"
  name          = "acp-admin-${var.environment}"
  force_destroy = true
}

data "aws_iam_policy_document" "admin_ip_restriction" {
  statement {
    sid       = "IAMIPRestriction"
    action    = ["*"]
    effect    = "Deny"
    resources = ["*"]

    condition {
      test     = "NotIpAddress"
      values   = ["${var.admin_ip_restriction}"]
      variable = "aws:SourceIp"
    }
  }
}

# Create an admin group to hold the relevant policies
resource "aws_iam_group" "admin" {
  count = "${var.create_admin_user ? 1 : 0}"
  name  = "acp-admin-${var.environment}"
}

# Add a admin ip restriction policy to the admin group is required
resource "aws_iam_group_policy" "admin_ip_restriction" {
  count  = "${length(var.admin_ip_restriction) > 0 ? 1 : 0}"
  group  = "${aws_iam_group.admin.name}"
  policy = "${data.aws_iam_policy_document.admin_ip_restriction.json}"
}

resource "aws_iam_group_policy_attachment" "admin" {
  count      = "${var.create_admin_user ? 1 : 0}"
  group      = "${aws_iam_group.admin.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_membership" "admin" {
  count = "${var.create_admin_user ? 1 : 0}"
  name  = "acp-admin-${var.environment}"
  group = "${aws_iam_group.admin.name}"
  users = ["${aws_iam_user.admin.name}"]
}
