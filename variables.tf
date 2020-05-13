variable "app-name" {
  description = "Name of the application"
}

variable "app-docker-image-repo" {
  description = "URL to the app's docker image"
}

variable "app-docker-image-tag" {
  description = "Name of docker image tag"
}

variable "app-cpu" {
  description = "Amount of CPU credits to allocate"
  type        = number
}

variable "app-memory" {
  description = "Amount of memory to allocate in Megabytes"
  type        = number
}

variable "app-environment-variables" {
  description = "Map of environment variables this app requires"
  type        = map(string)
}

variable "app-container-web-port" {
  description = "Port at which this app uses to listen to connections"
}

variable "app-lb-idle-timeout" {
  description = "ALB Idle timeout"
  type        = number
}

variable "app-lb-vpc-security-groups" {
  description = "VPC security groups to attach to ALB"
  type        = list(string)
}

variable "app-lb-vpc-subnets" {
  description = "VPC subnets to attach to ALB"
  type        = list(string)
}

variable "app-lb-vpc-id" {
  description = "VPC id to attach to ALB"
}

variable "app-lb-health-check-url" {
  description = "The app's health check URL"
}

variable "app-lb-https-certificate-arn" {
  description = "ARN of the SSL certificate stored in Amazon Certificate Manager (ACM) for the ALB to use"
}

variable "app-ecs-cluster-name" {
  description = "Name of the ECS cluster to provision this ECS app in"
}