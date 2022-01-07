module "vpc" {
  # source = "../"
  source = "git::https://github.com/mjheitland/tfminivpc.git?ref=1.0.1"

  cidr_block = "10.0.0.0/16"

  tags = var.tags
}