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
