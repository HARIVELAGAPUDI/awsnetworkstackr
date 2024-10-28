resource "aws_network_acl" "main" {
  count  = length(var.private_nacl)
  vpc_id = var.vpc_id

  egress {
    protocol   = "tcp"
    rule_no    = lookup(var.private_nacl[count.index], "egress_rule_no")
    action     = lookup(var.private_nacl[count.index], "egress_action")
    cidr_block = lookup(var.private_nacl[count.index], "egress_cidr")
    from_port  = lookup(var.private_nacl[count.index], "egress_from_port")
    to_port    = lookup(var.private_nacl[count.index], "egress_to_port")
  }

  ingress {
    protocol   = "tcp"
    rule_no    = lookup(var.private_nacl[count.index], "ingress_rule_no")
    action     = lookup(var.private_nacl[count.index], "ingress_action")
    cidr_block = lookup(var.private_nacl[count.index], "ingress_cidr")
    from_port  = lookup(var.private_nacl[count.index], "ingress_from_port")
    to_port    = lookup(var.private_nacl[count.index], "ingress_to_port")
  }

  tags = {
    Name        = format("${var.environment}-${var.app_id}-${var.region}-nacl-rules")
    Environment = var.environment
    Terraformed = "True"
  }
}


resource "aws_network_acl_association" "main" {
  count          = length(var.private_subnets)
  network_acl_id = element(aws_network_acl.main.*.id, count.index)
  subnet_id      = element(var.private_subnets,count.index)
  #depends_on     =   [aws_network_acl.main]
  #depends_on = [module.private_nacl.aws_network_acl.main]
}
