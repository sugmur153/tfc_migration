terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "tf_provisioning"
    storage_account_name = "tfcmigrationpoc"
    container_name       = "tfc-migration-poc"
    key                  = "tfe_np_ws_poc1.tfstate"
    access_key           = "4/kct+40HxKweY2VofS7Ha+Dzj6qEdlIBKtpRB9BPn4lmspsQIOpjTGEG5ww04S8LSUZ26OZfvzv+AStAzo1jA=="
  }
}

provider "azurerm" {
  subscription_id = "e468360d-1119-4dd6-8b2a-77b89b428561"
  tenant_id       = "7cacbdfd-ebad-46c0-8d1e-b7058ce44173"
  features {}
}

# Declare the variables
variable "var1" {}
variable "var2" {}
variable "var3" {}
variable "var4" {}


# Use the variables in the local file resource
#resource "local_file" "example" {
#  content  = "Hello, Terraform! Var1: ${var.var1}, Var2: ${var.var2}, Var3: ${var.var3}, Var4: ${var.var4}"
#  filename = "${path.module}/hello-${var.var3}.txt"
#}

resource "azurerm_resource_group" "example" {
  name     = "tfe_np_ws_poc1"
  location = "westus"
}
 
resource "azurerm_storage_account" "example" {
  name                     = "tfenpstatefilepoc1"
  resource_group_name = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
