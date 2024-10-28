variable "vpc_id" {
  description = "The ID of the VPC to associate DHCP options with."
  type        = string
}

variable "app_id" {
  type = string
}

variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "dhcp" {
  description = "List of DHCP options configurations"
  type = list(object({
    region                = string
    environment           = string
    domain_name           = string
    domain_name_servers   = list(string)
    ntp_servers           = list(string)
    netbios_name_servers  = list(string)
  }))
}
