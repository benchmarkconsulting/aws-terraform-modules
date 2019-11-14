resource "aws_instance" "compute" {
    ami = var.ami
    count = var.instance_count
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.vpc_security_group_ids
    tags = {
      Name = var.name[count.index+1]
      Terraform = "True"
  }
}