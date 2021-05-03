variable "access_key" {}

variable "secret_key" {}


variable "tag_name" {
  default = "tathagat-test-1"
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "us-east-1"
  tag_name = var.tag_name
}

resource "aws_instance" "ec2_instance_test" {
  ami           = "ami-0663143d1f1caa3bf"
  instance_type = "t2.micro"
  tags = {
    Name = var.tag_name
  }
}

output "tag" {
  value = var.tag_name
}

output "region" {
  value = "us-east-1"
}
