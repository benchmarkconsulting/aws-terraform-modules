resource "aws_instance" "harness" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.public_subnet_id
    vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
    tags = {
      Name = "bastion"
      Terraform = "True"
  }
}