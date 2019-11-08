resource "aws_vpc" "main" {
  count = length(var.vpc)
  cidr_block       = lookup(var.vpc[count.index], "cidr_block", "")
  instance_tenancy = lookup(var.vpc[count.index], "instance_tenancy", "")
  enable_dns_support = lookup(var.vpc[count.index], "enable_dns_suppor", "")
  enable_dns_hostnames = lookup(var.vpc[count.index], "enable_dns_hostnames", "")
  enable_classiclink = lookup(var.vpc[count.index], "enable_classiclink", "")
  tags = { 
    Name = "main"
    Terraform  = "true"
    Environment = "dev"
  }
}

#Public Subnets
resource "aws_subnet" "main" {
  count = length(var.subnet)
  vpc_id = lookup(var.vpc[count.index], "vpc_id", "")
  cidr_block = lookup(var.vpc[count.index], "cidr_block", "")
  map_public_ip_on_launch = lookup(var.vpc[count.index], "map_public_ip_on_launch", "")
  availability_zone = lookup(var.vpc[count.index], "availability_zone", "")
  tags = {
    Name = "main"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main-gw" {
  vpc_id = "${aws_vpc.main[0].id}"
  tags = { 
    Name = "main-gw"
  }
}

# route tables
resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.main[0].id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main-gw.id}"
  }
  tags = { 
    Name = "main-public-1"
  }
}

#Route Associated Public
#resource "aws_route_table_association" "main" {
 # subnet_id = "${aws_subnet.main[0]].id}"
 # route_table_id = "${aws_route_table.main.id}"
#}
