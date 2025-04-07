terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }
 
  backend "azurerm" {
    subscription_id = "e468360d-1119-4dd6-8b2a-77b89b428561"
    tenant_id = "7cacbdfd-ebad-46c0-8d1e-b7058ce44173"
    client_id = "21e07847-25e9-486d-b37e-e4635ae89325"
    client_secret = "WsP8Q~C-WTBxy4ubzteGIW3yTXU9u_qn7_ncrb5N"
    features {}
  }
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
