terraform {
  required_version = ">= 0.12.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.71"
    }
    # myvpc = {
    #   source  = "r53.heitland-it.de/mjheitland/tfminivpc/aws"
    #   version = "= 1.0.1"
    # }
  }
}

provider "aws" {
  region = var.region
}
