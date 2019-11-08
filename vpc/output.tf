output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The region where the subnets will be created"
}
