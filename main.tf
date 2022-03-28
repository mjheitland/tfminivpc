resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true
  tags       = merge(
    var.tags,
    { Source = "mjheitland/tfminivpc", Version = "${local.version}" }
  )
}

# This new default sg does not allow any traffic on any port (neither ingress nor egress).
# Without this resource AWS would automatically add its own default sg group to the new VPC that allows ingress and egress traffic on all ports!
# Your AWS account automatically has a default security group for the default VPC in each Region.
# If you don't specify a security group when you launch an instance, the instance is automatically associated with the default security group for the VPC. If you don't want your instances to use the default security group, you can create your own custom security groups and specify them when you launch your instances.
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.tags,
  {
    Name = "default"
  })
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.tags,
  {
    Name = "allow_tls"
  })
}

resource "aws_vpc_endpoint" "secretsmanager" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${local.region}.secretsmanager"
  vpc_endpoint_type = "Interface"
  auto_accept = true
  # subnet_ids          = [for subnet in aws_subnet.private : subnet.id]

  security_group_ids = [
    aws_security_group.allow_tls.id,
  ]

  private_dns_enabled = true

  tags = merge(var.tags,
  {
    Name = "secretsmanager"
  })
}