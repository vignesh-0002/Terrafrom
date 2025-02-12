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
   profile                = "AWS-Secrets"
   region                 = "us-east-1"
#}
