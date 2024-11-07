terraform {
  backend "s3" {
    bucket         = "tfstatebucket-23325"
    dynamodb_table = "TF-StateLock"
    key            = "terraform/statefile/terraform.tfstate"
    region         = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}