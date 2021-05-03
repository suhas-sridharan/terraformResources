variable "access_key" {}
variable "secret_key" {}
variable "region" {
    default = "us-east-1"
}
variable "tag_name" {}

provider "aws" {
       region = var.region
       access_key = var.access_key
       secret_key = var.secret_key
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
