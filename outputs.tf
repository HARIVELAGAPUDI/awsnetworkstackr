output "vpc_id" {
  value = module.vpc.*.vpc_id
}

output "private_subnets_id" {
  value = module.private_subnets.*.private_subnets_id
}

output "public_subnets_id" {
  value = module.public_subnets.*.public_subnets_id
}

output "igw_id" {
  value = module.igw.igw_id
}

output "public_route_table_id" {
  value = module.public_route_tables.*.public_route_table_id
}

output "public_route_table_owner_id" {
  value = module.public_route_tables.*.public_route_table_owner_id
}

output "private_route_table_id" {
  value = module.private_route_tables.*.private_route_table_id
}

output "private_route_table_owner_id" {
  value = module.private_route_tables.*.private_route_table_owner_id
}

output "nat_gw_id" {
  value = module.nat_gws.*.nat_gw_id
}


output "public_sg_id" {
  value = module.public_security_group.*.public_sg_id
}


output "private_sg_id" {
  value = module.private_security_group.*.private_sg_id
}


output "dhcp_options_id" {
  value = module.dhcp.*.dhcp_options_id
}


output "nacl_id" {
  value = module.nacl.*.nacl_id
}


output "private_nacl_id" {
  value = module.private_nacl.*.private_nacl_id
}