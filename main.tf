terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Variables for AWS credentials
variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

# Variable for tag value
variable "tag_value" {
  description = "The value for the tag"
  type        = string
}

# S3 bucket resource
resource "aws_s3_bucket" "r0han" {
  bucket = "my-unique-r0han" # Use a unique name
  tags = {
    "num" = var.tag_value # Use the variable in the tag
  }
}

resource "aws_instance" "example" {
  ami           = "ami-053b12d3152c0cc71" # AMI ID
  instance_type = "t2.micro"              # Instance type

  tags = {
    "num" = var.tag_value
  }
}
