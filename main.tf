terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c7217cdde317cfec" # Ubuntu 22.04 LTS
  #instance_type = var.instance_type
  instance_type = "t2.micro"
  tags = {
    Name = "ACME-WebServer"
  }
}
module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"
}
