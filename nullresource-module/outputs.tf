output "null_resource_splunk_provisioner_id" {
  value = { for name, resource in null_resource.splunk_provisioner : name => resource.id }
}