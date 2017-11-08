# Provider will inherit from environment variables
provider "aws" {
  version = "= 0.1.4"
}

data "aws_region" "current" {
  current = true
}

data "aws_caller_identity" "current" {}
