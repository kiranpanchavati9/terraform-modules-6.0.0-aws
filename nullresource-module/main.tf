resource "null_resource" "splunk_provisioner" {

  depends_on = [module.ec2-module.instance
                  ,module.route53-module.a-records
                  ,module.network-module.security_group
                  ,module.network-module.security_group_ingress_rule
                  ,module.network-module.security_group_ingress_rule
                  ,module.network-module.security_group_egress_rule]

  for_each = module.ec2-module.instance_public_ips

  provisioner "remote-exec" {
    connection {
      type        = var.ssh_type
      user        = var.ssh_user
      private_key = file("var.ssh_private_key")
      host        = each.value
    }
    inline = [
      "sudo cloud-init status --wait",
      "for i in 1 2 3 4 5; do sudo dnf install -y nginx git && break || sleep 10; done",
      "sudo systemctl enable --now nginx",
      "rm -rf /home/ec2-user/splunk-script",
      "git clone https://github.com/kiranpanchavati9/splunk-script.git /home/ec2-user/splunk-script",
      "cd /home/ec2-user/splunk-script && chmod +x splunk.sh && sudo bash splunk.sh"
    ]
  }
  
}
