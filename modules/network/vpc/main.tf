resource "aws_vpc" "demo" {
  count = length(var.vpc)
  cidr_block       = lookup(var.vpc[count.index],"cidr")
  instance_tenancy = lookup(var.vpc[count.index],"tenancy")
  enable_dns_support = lookup(var.vpc[count.index],"enable_dns_support")
  enable_dns_hostnames = lookup(var.vpc[count.index],"enable_dns_hostnames")
  tags = {
    Name = format("${var.environment}-${var.app_id}-${var.region}-%s", lookup(var.vpc[count.index], "name"))
    Environment = var.environment
    Terraformed = "True"
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  count      = length(var.vpc)
  vpc_id     = aws_vpc.demo.*.id[0]
  cidr_block = lookup(var.vpc[count.index],"secondary_cidr")
}