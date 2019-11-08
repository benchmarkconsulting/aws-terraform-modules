resource "aws_security_group" "default" {
 count              = length(var.sg)
 name               = lookup(var.sg[count.index], "name", "")
 vpc_id             = lookup(var.sg[count.index], "vpc_id", "")

 ingress {
   protocol             = lookup(var.sg[count.index], "ingress_protocol", "")
   to_port              = lookup(var.sg[count.index], "ingress_to_port", "")
   from_port            = lookup(var.sg[count.index], "ingress_from_port", "")
   cidr_blocks  = [lookup(var.sg[count.index], "ingress_cidr_blocks", "")]
 }
  egress {
   protocol             = lookup(var.sg[count.index], "egress_protocol", "")
   to_port              = lookup(var.sg[count.index], "egress_to_port", "")
   from_port            = lookup(var.sg[count.index], "egress_from_port", "")
   cidr_blocks   = [lookup(var.sg[count.index], "egress_cidr_blocks", "")]
 }
}
