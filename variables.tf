variable "aws_region" {
  description = "AWS region — must match the region where vpc_id exists"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The VPC ID to deploy resources into (must exist in the configured AWS region)"
  type        = string
  default     = "vpc-0fcbf944165ec4597"
}

variable ami {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-00adafae70b8029d8"
}

variable instance_type {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t3.small"
}

variable key_name {
  description = "The key name for the EC2 instance"
  type        = string
  default     = "aws-helpag"
}

variable iam_instance_profile {
  description = "The IAM instance profile to attach to the EC2 instances"
  type        = string
  default     = ""
}

variable components {
  description = "The number of EC2 instances to create"
  default     = {
    "frontend" = ""
    "catalogue" = ""
    "cart" = ""
    "user" = ""
    "shipping" = ""
    "payment" = ""
    "mysql" = ""
    "redis" = ""
    "rabbitmq" = ""
    "mongodb" = ""
  }
}

variable zone_id {
  description = "The Route 53 zone ID for the frontend application"
  type        = string
  default     = "Z01214421PKKTLXAI5VN5"
}

variable type {
  description = "The record type for the Route 53 record"
  type        = string
  default     = "A"
}

variable ttl {
  description = "The TTL for the Route 53 record"
  type        = number
  default     = 300
}

variable ssh_type{
  description = "The type of SSH connection to use"
  type        = string
  default     = "ssh"
}

variable ssh_user{
  description = "The user to use for the SSH connection"
  type        = string
  default     = "ec2-user"
}

variable ssh_private_key{
  description = "The private key to use for the SSH connection"
  type        = string
  default     = "/home/ec2-user/.ssh/aws-helpag.pem"
}