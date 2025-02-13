terraform {

  backend "s3" {
    bucket               = "ems-ops-jumisa-statebackend"
    dynamodb_table       = "state-lock"
    key                  = "demo/dev.tfstate"
    region               = "us-east-1"
    profile              = "default"
    encrypt              = true
  }

  required_providers {
    aws                  = {
                             source  = "hashicorp/aws"
                             version = "~> 5.0"
                           }
  }
}

# Configure the AWS Provider

#provider "aws" {
#  profile = "AWS-Secrets"  # Ensure this profile exists in ~/.aws/credentials
#  region  = "us-east-1"    # Specify the AWS region
#}



provider "aws" {
  region     = "us-east-1"
 # access_key = var.AWS_ACCESS_KEY_ID
 # secret_key = var.AWS_SECRET_ACCESS_KEY
}

