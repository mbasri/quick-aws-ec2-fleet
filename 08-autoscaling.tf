#---------------------------------------------------------------------------------------------------
# Auto Scaling Group
#---------------------------------------------------------------------------------------------------
module "autoscaling" {
  source = "git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-autoscaling?ref=v1.0.0"

  autoscaling_name = local.autoscaling_name

  # Amazon Linux 2023 AMI 2023.6.20250107.0 arm64 HVM kernel-6.1
  image_id = "ami-0ae9eb1a7a2e89c37"

  instance_types = [
    "t4g.micro",
    "t4g.small"
  ]

  min_size = 1
  max_size = 2

  subnet_ids = module.vpc.private_subnet_ids
  security_group_ids = [
    module.security-group-ec2.security_group_id
  ]

  user_data = data.cloudinit_config.main.rendered

  iam_instance_profile = module.iam-instance-profile.iam_instance_profile_id

  root_block_device = {
    delete_on_termination = true
    encrypted             = true
    kms_key_id            = module.kms.key_arn
    iops                  = 100
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }

  target_group_arns = [
    aws_lb_target_group.this.arn
  ]

  health_check_type         = "ELB"
  health_check_grace_period = 180

  tags = local.tags
}