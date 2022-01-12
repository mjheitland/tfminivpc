module "vpc" {
  # source = "../"
  # source = "git::https://github.com/mjheitland/tfminivpc.git?ref=1.0.1"
  source = "r53.heitland-it.de/mjheitland/tfminivpc/aws"
  version = "= 1.0.1"

  cidr_block = var.cidr_block

  tags = var.tags
}