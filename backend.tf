terraform {
  backend "http" {             
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.22.0"
    }
  }
}
## This Terraform configuration specifies an HTTP backend for state management 
## also declares that the AWS provider version 5.22.0 is required for the project.
