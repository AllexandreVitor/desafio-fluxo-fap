terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3  = "http://s3.localhost.localstack.cloud:4566"
    ec2 = "http://localhost.localstack.cloud:4566"
  }
}

# ============================================================
# S3
# ============================================================

resource "aws_s3_bucket" "app" {
  bucket = var.bucket_name
}

# ============================================================
# EC2
# ============================================================

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Desafio-Fluxo-FAP-AppServer"
  }
}
