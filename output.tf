output "gw_ip" {
    value = aws_nat_gateway.gw.allocation_id
    description = "The allocation id of the gateway IP address"
}

output "gw_id" {
    value = aws_route_table.internet.route.gateway_id
    description = "The VPC internet gatway identifier"
}