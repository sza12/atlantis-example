provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::438282242070:role/terraform_atlantis"
  }
}

terraform {
  backend "s3" {
    encrypt = true    
    bucket = "hella-buckets-213213123121a"
    key    = "test_server/staging/global/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_iam_role" "test_role1" {
  name = "test_role1"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}