#Required prerequisites

#Terraform0.12 and above only
terraform {
  required_version = ">= 0.12"
}

#Running this on aws & picking a region
provider "aws" {
  region = var.region
}
