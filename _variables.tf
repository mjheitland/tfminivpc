variable "cidr_block" {
  type        = string
  description = "CIDR block for VPC"
}

variable "tags" {
  type        = map(string)
  description = "Mandatory tags for VPC"
}