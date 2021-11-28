output "app-lb-arn" {
  description = "The ARN of the load balancer"
  value       = aws_alb.app-lb.arn
}

output "app-lb-url" {
  description = "The DNS name of the load balancer"
  value       = aws_alb.app-lb.dns_name
}
