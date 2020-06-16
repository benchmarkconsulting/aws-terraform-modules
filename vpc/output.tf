output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The region where the VPC network will be created"
}

output "subnet_public" {
  value       = aws_subnet.public.*.id
  description = "The region where the public subnets will be created"
}

output "subnet_private" {
  value       = aws_subnet.private.*.id
  description = "The region where the private subnets will be created"
}

output "internet_gw" {
  value       = aws_internet_gateway.main-gw.id
  description = "The region where the gateway will be created"
}