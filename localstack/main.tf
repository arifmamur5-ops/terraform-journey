terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    s3  = "http://localhost:4566"
    iam = "http://localhost:4566"
  }
}

# S3 bucket buat simpan node configs
resource "aws_s3_bucket" "node_configs" {
  bucket = "web3-node-configs"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "node_configs" {
  bucket = aws_s3_bucket.node_configs.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_iam_role" "web3_node_role" {
  name = "web3-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })

  tags = {
    Name        = "web3-node"
    Environment = var.environment
    Role        = "ethereum-node"
  }
}

output "iam_role_arn" {
  value = aws_iam_role.web3_node_role.arn
}

# Upload file config ke S3
resource "aws_s3_object" "geth_config" {
  bucket  = aws_s3_bucket.node_configs.bucket
  key     = "geth/config.json"
  content = jsonencode({
    network  = "holesky"
    syncmode = "snap"
    http_api = "eth,net,web3,engine,admin"
  })
  content_type = "application/json"
}
