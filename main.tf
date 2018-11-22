# Provider will inherit from environment variables
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}
