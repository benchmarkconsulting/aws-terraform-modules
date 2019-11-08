resource "aws_security_group" "default" {
 count              = length(var.firewall)
 name               = lookup(var.firewall[count.index], "name", "")
 vpc_id             = lookup(var.firewall[count.index], "vpc_id", "")

 ingress {
   protocol             = lookup(var.firewall[count.index], "ingress_protocol", "")
   to_port              = lookup(var.firewall[count.index], "ingress_to_port", "")
   from_port            = lookup(var.firewall[count.index], "ingress_from_port", "")
   cidr_blocks  = [lookup(var.firewall[count.index], "ingress_cidr_blocks", "")]
 }
  egress {
   protocol             = lookup(var.firewall[count.index], "egress_protocol", "")
   to_port              = lookup(var.firewall[count.index], "egress_to_port", "")
   from_port            = lookup(var.firewall[count.index], "egress_from_port", "")
   cidr_blocks   = [lookup(var.firewall[count.index], "egress_cidr_blocks", "")]
 }
}
