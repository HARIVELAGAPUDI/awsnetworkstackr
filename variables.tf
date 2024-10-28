variable "region" {
  type = string
}

variable "vpc" {
  type = list(any)
}

variable "environment" {
  type = string
}

variable "public_subnets" {
  type = list(any)
}

variable "private_subnets" {
  type = list(any)
}

variable "igw_name" {
  type = string
}

variable "public_subnet_route_tables" {
  type = list(any)
}

variable "private_subnet_route_tables" {
  type = list(any)
}


variable "public_security_group_rules" {
  type = list(any)
}

variable "public_security_groups" {
  type = list(any)
}


variable "private_security_group_rules" {
  type = list(any)
}

variable "private_security_groups" {
  type = list(any)
}

variable "app_id" {
  type = string
}

variable "dhcp" {
  type = list
}

#variable "dhcp" {
#  description = "List of DHCP options configurations"
#  type = list(object({
#    region                = string
#    environment           = string
#    domain_name           = string
#    domain_name_servers   = list(string)
#    ntp_servers           = list(string)
#    netbios_name_servers  = list(string)
#  }))
#}


variable "nacl" {
  type = list
}

variable "private_nacl" {
  type = list
}