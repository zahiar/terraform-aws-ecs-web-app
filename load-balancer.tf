resource "aws_alb" "app-lb" {
  name         = "${var.app-name}-load-balancer"
  internal     = false
  idle_timeout = var.app-lb-idle-timeout

  security_groups = var.app-lb-vpc-security-groups
  subnets         = var.app-lb-vpc-subnets

  depends_on = [aws_alb_target_group.app-lb-target-group]
}

resource "aws_alb_target_group" "app-lb-target-group" {
  name     = "${var.app-name}-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.app-lb-vpc-id

  health_check {
    path                = var.app-lb-health-check-url
    healthy_threshold   = "5"
    unhealthy_threshold = "2"
    matcher             = 200
  }
}

resource "aws_alb_listener" "app-lb-http-listener" {
  load_balancer_arn = aws_alb.app-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  depends_on = [aws_alb_target_group.app-lb-target-group]
}

resource "aws_alb_listener" "app-lb-https-listener" {
  load_balancer_arn = aws_alb.app-lb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.app-lb-https-certificate-arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.app-lb-target-group.arn
  }

  depends_on = [aws_alb_target_group.app-lb-target-group]
}
