output "subnet_id" {
    value = aws_instance.compute.subnet_id
    description = "The Id of the VPC subnet to launch the module in"
}
output "ami" {
    value = aws_instance.compute.ami
    description = "The AMI required to lauch the instance being created"
}