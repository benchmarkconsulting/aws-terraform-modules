output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The region where the subnets will be created"
}

output "subnet_public" {
  value       = aws_subnet.public.*.id
  description = "The region where the subnets will be created"
}

output "subnet_private" {
  value       = aws_subnet.private.*.id
  description = "The region where the subnets will be created"
}