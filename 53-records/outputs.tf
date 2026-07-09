output "a-records" {
  description = "The Route 53 records for the frontend application"
  value = aws_route53_record.a-records
}