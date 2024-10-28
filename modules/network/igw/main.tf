resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = var.vpc_id
  tags = {
    Name = format("${var.environment}-${var.app_id}-${var.region}-%s",var.igw_name)
	  Environment = var.environment
 	  Terraformed = "True"
  }
}