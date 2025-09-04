terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Configure the S3 backend for storing the Terraform state file.
  # This is critical for running Terraform in a CI/CD pipeline.
  # REPLACE "your-unique-terraform-state-bucket-name" with a globally unique S3 bucket name.
  backend "s3" {
    bucket = "your-unique-terraform-state-bucket-name"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1" # You can change this, but us-east-1 is common for global resources.
  }
}

provider "aws" {
  region = "us-east-1" # Main region for your resources.
}
