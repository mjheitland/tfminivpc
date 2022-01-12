variable "cidr_block" {
  type        = string
  description = "CIDR block for VPC"
}

locals {
  version = "1.0.2"
}