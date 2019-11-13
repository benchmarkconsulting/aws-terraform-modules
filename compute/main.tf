resource "aws_instance" "harness" {
    ami = "ami-04763b3055de4860b"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.main-public-1.id}"
    vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
    key_name = "${aws_key_pair.demo-key.id}"
    tags = {
      Name = "harness-delegate"
      Terraform = "True"
  }
}