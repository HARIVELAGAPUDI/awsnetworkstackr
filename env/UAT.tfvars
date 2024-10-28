region = "us-west-2"

environment = "UAT"

app_id = "T-Mobile"

dhcp = [
  {
    region                = "us-west-1"
    environment           = "dev"
    domain_name           = "dev.example.com"
    domain_name_servers   = ["8.8.8.8", "8.8.4.4"]
    ntp_servers           = ["time.dev.example.com"]
    netbios_name_servers  = ["netbios.dev.example.com"]
  },
  {
    region                = "us-west-1"
    environment           = "prod"
    domain_name           = "prod.example.com"
    domain_name_servers   = ["8.8.8.8", "8.8.4.4"]
    ntp_servers           = ["time.prod.example.com"]
    netbios_name_servers  = ["netbios.prod.example.com"]
  },
  # Define additional DHCP configurations for other regions/environments...
]
#dhcp = [
#    {
#        domain_name          = "example.com"
#        domain_name_servers  = ["8.8.8.8", "8.8.4.4"]
#        ntp_servers          = ["127.0.0.1"]
#        netbios_name_servers = ["127.0.0.1"]
#    }
#]

vpc = [
    {
        cidr = "172.30.0.0/16"
        enable_dns_support = "true"
        enable_dns_hostnames = "true"
        name = "test-vpc"
        tenancy = "default"
        secondary_cidr = "172.16.0.0/21"
    }
]

public_subnets = [
        {
            cidr = "172.30.1.0/24"
            name = "public-subnet-2a"
            availability_zone = "us-west-2a"
            map_public_ip_on_launch = "true"
        },
                
        {
            cidr = "172.30.2.0/24"
            name = "public-subnet-2b"
            availability_zone = "us-west-2b"
            map_public_ip_on_launch = "true"
        }

]

private_subnets = [
        {
            cidr = "172.30.100.0/24"
            name = "private-subnet-2a"
            availability_zone = "us-west-2a" 
        },
                
        {
            cidr = "172.30.101.0/24"
            name = "private-subnet-1b"
            availability_zone = "us-west-2b"
        }
]

igw_name = "vpc-1-igw"

public_subnet_route_tables = [
    {
        name = "public-route-table"
    }
]

private_subnet_route_tables = [
    {
        name = "private-route-table-2a"
    },

    {
        name = "private-route-table-2b"
    },
    
]

public_security_groups = [
    {
        name = "public-security-group-1"
        description = "This is public security group"
    }
]

public_security_group_rules = [
    {
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
    },
    {
        from_port   = "80"
        to_port     = "80"
        protocol    = "tcp"
    }
]

private_security_groups = [
    {
        name = "private-security-group-1"
        description = "This is private security group"
    },

    {
        name = "private-security-group-2"
        description = "This is private security group"
    },

    {
        name = "vpc-endpoint-sg"
        description = "sg created for vpc endpoints"
    }
]


private_security_group_rules = [
    {
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
    },
    {
        from_port   = "80"
        to_port     = "80"
        protocol    = "tcp"
    },
    {
        from_port   = "443"
        to_port     = "443"
        protocol    = "TCP"
    }
]

## this code contains all variables you can add respective block of you want more of that resorce

nacl = [
    {
        egress_rule_no    = "200"
        egress_action     = "allow"
        egress_cidr       = "0.0.0.0/0"
        egress_from_port  = "443"
        egress_to_port    = "443"
        ingress_rule_no   = "200"
        ingress_action    = "allow"
        ingress_cidr      = "0.0.0.0/0"
        ingress_from_port = "443"
        ingress_to_port   = "443"

    }
]

private_nacl = [
    {
        egress_rule_no    = "200"
        egress_action     = "allow"
        egress_cidr       = "0.0.0.0/0"
        egress_from_port  = "443"
        egress_to_port    = "443"
        ingress_rule_no   = "200"
        ingress_action    = "allow"
        ingress_cidr      = "0.0.0.0/0"
        ingress_from_port = "443"
        ingress_to_port   = "443"
    }
]