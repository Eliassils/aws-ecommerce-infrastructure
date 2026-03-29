terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "devops-projeto-ecommerce-elias"
    key    = "networking/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "nsse-terraform-state-locking"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  assume_role {
    role_arn     = var.assume_role.role_arn
    
    
  }
}
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
