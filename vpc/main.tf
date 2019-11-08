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
resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  map_public_ip_on_launch = lookup(var.public_subnets[count.index], "map_public_ip_on_launch", "")
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "public-main"
  }
}

#Private Subnets
resource "aws_subnet" "private" {
  count = length(var.private_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnets[count.index]
  map_public_ip_on_launch = lookup(var.private_subnets[count.index], "map_public_ip_on_launch", "")
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "private-main"
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
resource "aws_route_table" "public" {
  count = length(var.public_subnets)
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
   gateway_id = "${aws_internet_gateway.main-gw.id}"
  }
  tags = { 
    Name = "main-public-1"
  }
}

resource "aws_route_table" "private" {
  count = length(var.private_subnets)
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
   gateway_id = "${aws_internet_gateway.main-gw.id}"
  }
  tags = { 
    Name = "main-private-1"
  }
}

#Route Associated Public

resource "aws_route_table_association" "private" {
  count = length(var.private_subnets)

  subnet_id = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id)
}
resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)

  subnet_id = element(aws_subnet.public.*.id, count.index)
  route_table_id = element(aws_route_table.public.*.id)
}
