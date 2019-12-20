output "sg_id" {
  value       = aws_security_group.default.*.id
  description = "The security group that was created"
}
