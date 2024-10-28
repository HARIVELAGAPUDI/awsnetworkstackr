variable "vpc_id" {
    type = string
}

variable "public_subnets" {
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