output "aws_route_table_association" {
  value = aws_subnet.main.*.id
}