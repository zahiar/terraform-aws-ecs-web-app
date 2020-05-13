output "app-lb-arn" {
  value = aws_alb.app-lb.arn
}

output "app-lb-url" {
  value = aws_alb.app-lb.dns_name
}
