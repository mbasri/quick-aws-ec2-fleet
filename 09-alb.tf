#---------------------------------------------------------------------------------------------------
# Target Group
#---------------------------------------------------------------------------------------------------
resource "aws_lb_target_group" "this" {
  name = local.target_group_name

  vpc_id      = module.vpc.vpc_id
  target_type = "instance"
  protocol    = "HTTP"
  port        = 80

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    matcher             = "200"
    healthy_threshold   = 3
    unhealthy_threshold = 2
  }

  tags = local.tags
}

#---------------------------------------------------------------------------------------------------
# Auto Scaling Group
#---------------------------------------------------------------------------------------------------
module "alb" {
  source = "git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-alb?ref=v1.0.0"

  alb_name = local.alb_name

  internal = false

  subnets = module.vpc.public_subnet_ids

  security_groups = [
    module.security-group-alb.security_group_id
  ]

  http_listeners_port = [
    80
  ]

  tags = local.tags
}

#---------------------------------------------------------------------------------------------------
# ALB Listener Rule
#---------------------------------------------------------------------------------------------------
resource "aws_lb_listener_rule" "this" {
  listener_arn = module.alb.http_listener_arns[0]

  priority = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }

  tags = local.tags
}
