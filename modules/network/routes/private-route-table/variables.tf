variable "nat_gw_id" {
    type = list
}

variable "private_subnet_route_tables" {
    type = list
}

variable "vpc_id" {
    type = string
}

variable "private_subnets" {
    type = list
}

variable "environment" {
    type = string
}

variable "app_id" {
  type = string
}

variable "region" {
  type = string
}