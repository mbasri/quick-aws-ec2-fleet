#---------------------------------------------------------------------------------------------------
# locals variables
#---------------------------------------------------------------------------------------------------
locals {
  name   = "quick-aws-ec2-fleet"
  region = "eu-west-3"

  description = "Quick AWS EC2 Fleet"

  kms_name                  = local.name
  vpc_name                  = local.name
  security_group_name       = local.name
  iam_instance_profile_name = local.name
  autoscaling_name          = local.name
  ssm_parameter_name        = local.name

  tags = {
    "Name"        = local.name,
    "Description" = "Quick AWS EC2 Fleet",

    "billing:organisation"      = "mbasri",
    "billing:organisation-unit" = "labs",
    "billing:application"       = "quick-aws-ec2-fleet",
    "billing:environment"       = "dev",

    "security:compliance"     = "HIPAA",
    "security:data-sensitity" = "1",
    "security:encryption"     = "true",

    "technical:terraform"                     = "true",
    "technical:terraform:scm"                 = "https://github.com/mbasri/quick-aws-ec2-fleet.git",
    "technical:terraform:required-version"    = "1.10.2",
    "technical:provider:aws:required-version" = "5.81.0"
  }
}
