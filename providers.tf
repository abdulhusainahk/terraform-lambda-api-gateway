terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.17.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.2.0"
    }
  }
  required_version = "~> 1.0"
}

provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "thinkbridge"
}
