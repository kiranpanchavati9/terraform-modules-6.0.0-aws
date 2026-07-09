resource "aws_route53_record" "a-records" {
  for_each = module.ec2-module.instance_ids
  zone_id = var.zone_id
  name    = each.key
  type    = var.type
  ttl     = var.ttl
  records = module.network-module.security_group_id[each.key].public_ip
}