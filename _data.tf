# To obtain the name of the AWS region configured on the provider
data "aws_region" "current" {}

data "aws_vpc_endpoint" "secretsmanager" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${local.region}.secretsmanager"
}