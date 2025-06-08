#---------------------------------------------------------------------------------------------------
# Security Group for EC2
#---------------------------------------------------------------------------------------------------
module "security-group-ec2" {
  source = "git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-security-group?ref=v1.2.0"

  vpc_id = module.vpc.vpc_id

  security_group_name = "${local.security_group_name}-ec2"
  description         = local.description

  ingress_rules_with_referenced_security_group_id = [
    {
      ip_protocol                  = "tcp"
      from_port                    = "80"
      to_port                      = "80"
      referenced_security_group_id = module.security-group-alb.security_group_id
      description                  = "[Terraform] HTTP from ALB"
    },
  ]

  egress_rules = [
    {
      ip_protocol = "tcp"
      from_port   = "80"
      to_port     = "80"
      cidr_ipv4   = "0.0.0.0/0"
      description = "[Terraform] HTTP for Internet"
    },
    {
      ip_protocol = "tcp"
      from_port   = "443"
      to_port     = "443"
      cidr_ipv4   = "0.0.0.0/0"
      description = "[Terraform] HTTPS for Internet"
    }
  ]

  tags = local.tags
}

#---------------------------------------------------------------------------------------------------
# Security Group for ALB
#---------------------------------------------------------------------------------------------------
module "security-group-alb" {
  source = "git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-security-group?ref=v1.2.0"

  vpc_id = module.vpc.vpc_id

  security_group_name = "${local.security_group_name}-alb"
  description         = local.description

  ingress_rules = [
    {
      ip_protocol = "tcp"
      from_port   = "80"
      to_port     = "80"
      cidr_ipv4   = "0.0.0.0/0"
      description = "[Terraform] HTTP from Internet"
    },
    {
      ip_protocol = "tcp"
      from_port   = "443"
      to_port     = "443"
      cidr_ipv4   = "0.0.0.0/0"
      description = "[Terraform] HTTPS from Internet"
    }
  ]

  egress_rules = [
    {
      ip_protocol = "tcp"
      from_port   = "80"
      to_port     = "80"
      cidr_ipv4   = "10.0.0.0/24"
      description = "[Terraform] HTTP for VPC"
    }
  ]

  tags = local.tags
}
