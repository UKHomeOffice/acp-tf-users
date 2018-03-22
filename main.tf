# Provider will inherit from environment variables
provider "aws" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
