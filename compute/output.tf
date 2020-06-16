output "subnet_id" {
    value = aws_instance.compute.subnet_id
    description = "The Id of the VPC subnet to launch the module in"
}