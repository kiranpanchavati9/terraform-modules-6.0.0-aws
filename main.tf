module "network-module" {
  source = "./network-module"
  vpc_id = var.vpc_id
}

module "ec2-module" {
  source                 = "./ec2-module"
  components             = var.components
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  iam_instance_profile   = var.iam_instance_profile
  vpc_security_group_ids = [module.network-module.security_group_id]
  tags                   = {}
}


module "53-records" {
  source = "./s3-records"
  zone_id = var.zone_id
  type = var.type
  ttl = var.ttl
}