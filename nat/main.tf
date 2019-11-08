resource "aws_eip" "main" {
  vpc = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.main.id
  subnet_id = var.public_subnet_id
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route_table" "internet" {
  vpc_id = var.vpc_id
}

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw.id
  }

resource "aws_route_table_association" "private" {
  subnet_id      = var.private_subnet_id
  route_table_id = "aws_route_table.internet.id"
}
