output "instance_id" {
    description = "The IDs of the instances, keyed by component name"
    value = { for name, instance in aws_instance.instance : name => instance.id }
}
