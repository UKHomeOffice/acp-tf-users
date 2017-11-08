# Create an admin user
resource "aws_iam_user" "admin" {
  count         = "${var.create_admin_user ? 1 : 0}"
  name          = "acp-admin-${var.environment}"
  force_destroy = true
}

# Create an admin group to hold the relevant policies
resource "aws_iam_group" "admin" {
  count = "${var.create_admin_user ? 1 : 0}"
  name  = "acp-admin-${var.environment}"
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
