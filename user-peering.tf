resource "aws_iam_user" "peering" {
  count = var.create_peering_user ? 1 : 0

  name          = "acp-peering-${var.environment}"
  force_destroy = true
  tags = merge(
    local.email_tags,
    {
      "key_rotation" = var.key_rotation
    }
  )
}

resource "aws_iam_group" "peering" {
  count = var.create_peering_user ? 1 : 0

  name = "acp-peering-${var.environment}"
}

resource "aws_iam_group_membership" "peering" {
  count = var.create_peering_user ? 1 : 0

  name  = "acp-peering-${var.environment}"
  group = aws_iam_group.peering[0].name
  users = [aws_iam_user.peering[0].name]
}

# Allow access for terraform to create peering
data "aws_iam_policy_document" "peering" {
  statement {
    actions = [
      "ec2:AcceptVpcPeeringConnection",
      "ec2:CreateRoute",
      "ec2:CreateVpcPeeringConnection",
      "ec2:DeleteRoute",
      "ec2:DeleteVpcPeeringConnection",
      "ec2:DeleteVpnConnectionRoute",
      "ec2:DescribeRouteTables",
      "ec2:DescribeVpcAttribute",
      "ec2:DescribeVpcPeeringConnections",
      "ec2:DescribeVpcs",
      "ec2:ModifyVpcPeeringConnectionOptions",
      "ec2:RejectVpcPeeringConnection",
      "ec2:ReplaceRoute",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "peering" {
  count = var.create_peering_user ? 1 : 0

  name        = "acp-peering-${var.environment}"
  description = "Allow terraform to create, accept VPC peering requests and add routing"
  policy      = data.aws_iam_policy_document.peering.json
}

resource "aws_iam_group_policy_attachment" "peering" {
  count = var.create_peering_user ? 1 : 0

  group      = aws_iam_group.peering[0].name
  policy_arn = aws_iam_policy.peering[0].arn
}

resource "aws_iam_group_policy_attachment" "peering_restrict" {
  count      = length(var.access_restriction) > 0 && var.create_peering_user ? 1 : 0
  group      = aws_iam_group.peering[0].name
  policy_arn = aws_iam_policy.access_restriction[0].arn
}

