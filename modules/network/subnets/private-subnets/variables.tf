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