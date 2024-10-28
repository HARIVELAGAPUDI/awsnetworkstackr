locals {
  # Filter the DHCP options based on region and environment
  selected_dhcp_options = [for dhcp_option in var.dhcp : dhcp_option if dhcp_option.region == var.region && dhcp_option.environment == var.environment]
}

resource "aws_vpc_dhcp_options" "dhcp_options" {
  count                = length(local.selected_dhcp_options)
  domain_name          = local.selected_dhcp_options[count.index].domain_name
  domain_name_servers  = local.selected_dhcp_options[count.index].domain_name_servers
  ntp_servers          = local.selected_dhcp_options[count.index].ntp_servers
  netbios_name_servers = local.selected_dhcp_options[count.index].netbios_name_servers
  tags = {
    Name        = format("${var.environment}-${var.app_id}-${var.region}-dhcp-options")
    Environment = var.environment
    Terraformed = "True"
  }
}

resource "aws_vpc_dhcp_options_association" "dhcp_association" {
  count          = length(local.selected_dhcp_options)
  vpc_id         = var.vpc_id
  dhcp_options_id = element(aws_vpc_dhcp_options.dhcp_options.*.id, count.index)
}
