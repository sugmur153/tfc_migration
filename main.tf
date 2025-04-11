terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

# Declare the variables
variable "var1" {}
variable "var2" {}
variable "var3" {}
variable "var4" {}

# Use the variables in the local file resource
resource "local_file" "example" {
  content  = "Hello, Terraform! Var1: ${var.var1}, Var2: ${var.var2}, Var3: ${var.var3}, Var4: ${var.var4}"
  filename = "${path.module}/hello-${var.var3}.txt"
}
