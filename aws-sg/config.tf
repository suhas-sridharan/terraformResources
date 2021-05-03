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
       tag_name = var.tag
}


resource "aws_security_group" "sg-test" {
  description = "dev_test security group allows ssh for everyone"
  name        = "allow-ssh-${var.tag_name}"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "security_group" {
    value = ["${aws_security_group.sg-test.id}"]
}

output "region" {
    value = var.region
}
