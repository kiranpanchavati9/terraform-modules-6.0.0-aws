resource "aws_security_group" "allow_ports_firewall_aws" {
  name        = "allow_ports_firewall_aws"
  description = "Allow roboshop firewall inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id
  tags = {
    Name = "allow_ports_firewall_aws"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ports_firewall_aws" {
  security_group_id = aws_security_group.allow_ports_firewall_aws.id
  cidr_ipv4         = aws_vpc_security_group_egress_rule.allow_all_traffic_ipv4.cidr_ipv4
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
    tags = {
        Name = "allow_ports_firewall_aws_ingress"
    }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_ports_firewall_aws.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
  tags = {
    Name = "allow_all_traffic_ports_firewall_aws_ingress"
  }
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_ports_firewall_aws.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
  tags = {
    Name = "allow_all_traffic_ports_firewall_aws_egress"
  }
}