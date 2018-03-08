# Provider will inherit from environment variables
provider "aws" {
}

data "aws_region" "current" {
  current = true
}

data "aws_caller_identity" "current" {}
