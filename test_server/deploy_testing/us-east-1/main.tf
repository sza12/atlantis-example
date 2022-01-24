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
    key    = "test_server/deploy-testing/us-east-1/terraform.tfstate"
    region = "us-east-1"
  }
}

module "server" {
    source        = "../../modules/server"
}