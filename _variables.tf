variable "cidr_block" {
  type        = string
  description = "CIDR block for VPC"
}

variable "tags" {
  type        = map(string)
  description = "Mandatory tags for VPC"
}

locals {
  version = "1.0.2"
  region = data.aws_region.current.name
}