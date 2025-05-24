#---------------------------------------------------------------------------------------------------
# Security Group
#---------------------------------------------------------------------------------------------------
module "security-group" {
  source = "git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-security-group?ref=v1.2.0"

  vpc_id = module.vpc.vpc_id

  security_group_name = local.security_group_name
  description         = local.description

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
