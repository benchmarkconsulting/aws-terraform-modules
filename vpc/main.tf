resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_classiclink = var.enable_classiclink
  tags = { 
    Name = "main"
    Terraform  = "true"
    Environment = "dev"
  }
}

#Public Subnets
resource "aws_subnet" "main" {
  count = length(var.subnet)
  vpc_id = aws_vpc.main.id
  cidr_block = lookup(var.subnet[count.index], "cidr_block", "")
  map_public_ip_on_launch = lookup(var.subnet[count.index], "map_public_ip_on_launch", "")
  availability_zone = lookup(var.subnet[count.index], "availability_zone", "")
  tags = {
    Name = "main"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main-gw" {
  vpc_id = "${aws_vpc.main.id}"
  tags = { 
   Name = "main-gw"
  }
}

# route tables
resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
   gateway_id = "${aws_internet_gateway.main-gw.id}"
  }
  tags = { 
    Name = "main-public-1"
  }
}

#Route Associated Public
resource "aws_route_table_association" "main" {
  subnet_id = element(aws_subnet.main.*.id, , count.index)
  route_table_id = "${aws_route_table.main.id}"
}
