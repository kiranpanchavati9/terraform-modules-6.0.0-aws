resource "aws_route53_record" "a-records" {
  for_each = var.components
  zone_id = var.zone_id
  name    = each.key
  type    = var.type
  ttl     = var.ttl
  records = [var.instance_ips[each.key]]
}