provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::431095615907:role/terraform_atlantis"
  }
}

terraform {
  backend "s3" {
    encrypt = true    
    bucket = "hella-buckets-21321312312"
    key    = "test_server/staging/global/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_iam_role" "test_role" {
  name = "test_role"

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
