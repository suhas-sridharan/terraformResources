variable "access_key" {}

variable "secret_key" {}


variable "tag" {
  default = "tathagat-test-1"
}

variable "instance_type" {
  default = "t2.micro"
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "us-east-1"
}

terraform {
  backend "s3" {
    access_key = var.access_key
    secret_key = var.secret_key
    # Replace this with your bucket name!
    bucket         = "terraform-state-suhas-test"
    region         = "us-east-1"
    key = "terraform.tfstate"
    # Replace this with your DynamoDB table name!
    encrypt        = true
  }
}

output "tag" {
  value = var.tag
}

output "instance_type" {
  value = var.instance_type
}
