resource "aws_eip" "main" {
  vpc = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.main.id
  subnet_id = var.public_subnet_id
  
}

resource "aws_route_table" "internet" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw.id
  }

  tags = {

    Name = "internet-rt"
  }
}
resource "aws_route_table_association" "private" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.internet.id
}
