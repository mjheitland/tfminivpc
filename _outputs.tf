output "vpc" {
  value = aws_vpc.main
}

output "vpce_secretsmanager" {
  value = data.aws_vpc_endpoint.secretsmanager
}