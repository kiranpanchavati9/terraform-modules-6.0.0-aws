output "security_group_id" {
    description = "The ID of the security group"
    value = module.network-module.security_group_id
}

output "security_group_ingress_rule_id" {
    description = "The ID of the security group ingress rule"
    value = module.network-module.security_group_ingress_rule_id
}

output "security_group_egress_rule_id" {
    description = "The ID of the security group egress rule"
    value = module.network-module.security_group_egress_rule_id
}

