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
    key    = "test_server/production/us-east-1/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "production-web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "Production"
  }
} 