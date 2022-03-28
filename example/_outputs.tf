output "vpc" {
  value = module.vpc.vpc
}

output "vpce_secretsmanager" {
  value = module.vpc.vpce_secretsmanager
}