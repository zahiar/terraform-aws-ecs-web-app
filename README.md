# Terraform AWS ECS Web App Module

A terraform module to create a web app (complete with ECS service, task definition & a public-facing ALB) in AWS ECS.

## Usage Example
```
provider "aws" {
  region = "eu-west-2"
}

module "my-web-app" {
  source = "zahiar/ecs-web-app/aws"

  app-container-web-port = 8080
  app-cpu = 1024
  app-docker-image-repo = "my-app/web"
  app-docker-image-tag = "latest"
  app-ecs-cluster-name = "my-cluster"
  app-lb-health-check-url = "/health"
  app-lb-https-certificate-arn = "my-acm-cert-arn"
  app-lb-idle-timeout = 30
  app-lb-vpc-id = "my-vpc-id"
  app-memory = 1024
  app-name = "my-web-app"
  app-environment-variables = {
    SOME_ENV: "SOME_VALUE"
    ANOTHER_ENV: "ANOTHER_VALUE"
  }
  app-lb-vpc-security-groups = ["my-sg-abc", "my-sg-xyz"]
  app-lb-vpc-subnets = ["my-subnet-abc", "my-subnet-xyz"]
}
```
