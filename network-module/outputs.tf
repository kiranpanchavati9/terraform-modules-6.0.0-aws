output "security_group_id" {
    description = "The ID of the security group"
    value = aws_security_group.allow_ports_firewall_aws.id
}
output "security_group_ingress_rule_id" {
    description = "The ID of the security group ingress rule"
    value = aws_vpc_security_group_ingress_rule.allow_ports_firewall_aws.id
}

output "security_group_egress_rule_id" {
    description = "The ID of the security group egress rule"
    value = aws_vpc_security_group_egress_rule.allow_all_traffic_ipv4.id
}   