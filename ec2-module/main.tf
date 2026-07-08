## Create EC2 instances for each component

resource "aws_instance" "instance" {
  for_each = var.components
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  iam_instance_profile = var.iam_instance_profile
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = each.key
  }
}