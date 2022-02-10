resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags       = merge(
    var.tags,
    { Source = "mjheitland/tfminivpc", Version = "${local.version}" }
  )
}

# This new default sg does not allow any traffic on any port (neither ingress nor egress).
# Without this resource AWS would automatically add its own default sg group to the new VPC that allows ingress and egress traffic on all ports!
# Your AWS account automatically has a default security group for the default VPC in each Region.
# If you don't specify a security group when you launch an instance, the instance is automatically associated with the default security group for the VPC. If you don't want your instances to use the default security group, you can create your own custom security groups and specify them when you launch your instances.
resource "aws_default_security_group" "vpc" {
  vpc_id = aws_vpc.vpc.id

  tags = var.tags
}
