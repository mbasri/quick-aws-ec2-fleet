#---------------------------------------------------------------------------------------------------
# KMS
#---------------------------------------------------------------------------------------------------
output "key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.kms.key_arn
}

output "key_id" {
  description = "Name of the key"
  value       = module.kms.key_id
}

output "key_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = module.kms.key_alias_arn
}

output "key_alias_name" {
  description = "Name of the key alis"
  value       = module.kms.key_alias_name
}

output "key_policy" {
  description = "The IAM resource policy set on the key"
  value       = module.kms.key_policy
}

#---------------------------------------------------------------------------------------------------
# VPC
#---------------------------------------------------------------------------------------------------
output "region" {
  description = "The Name of the region"
  value       = module.vpc.region
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_blocks" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_blocks
}

output "nat_gateway_public_ips" {
  description = "Private IP of NAT Gateway"
  value       = module.vpc.nat_gateway_public_ips
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnet_ids
}

output "public_subnet_cidr" {
  description = "List of cidr_blocks of public subnets"
  value       = module.vpc.public_subnet_cidr
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnet_ids
}

output "private_subnet_cidr" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnet_cidr
}

output "secure_subnet_ids" {
  description = "List of IDs of secure subnets"
  value       = module.vpc.secure_subnet_ids
}

output "secure_subnet_cidr" {
  description = "List of cidr_blocks of secure subnets"
  value       = module.vpc.secure_subnet_cidr
}

output "default_security_group_id" {
  description = "The ID of the VPC default security group"
  value       = module.vpc.default_security_group_id
}

output "system_logs_cwl_id" {
  description = "The IDs of the cloudwatch logs for VM system logs"
  value       = module.vpc.system_logs_cwl_id
}

output "spot_logs_cwl_id" {
  description = "The IDs of the cloudwatch logs for Spot logging"
  value       = module.vpc.spot_logs_cwl_id
}

output "vpc_flow_logs_cwl_id" {
  description = "The ID of the cloudwatch logs for VPC flow logs"
  value       = module.vpc.vpc_flow_logs_cwl_id
}

#---------------------------------------------------------------------------------------------------
# Security Group
#---------------------------------------------------------------------------------------------------
output "security_groups_arn" {
  description = "The ARN of the security group"
  value = {
    "ec2" = module.security-group-ec2.security_group_arn,
    "alb" = module.security-group-alb.security_group_arn
  }
}

output "security_groups_id" {
  description = "The ID of the security group"
  value = {
    "ec2" = module.security-group-ec2.security_group_id,
    "alb" = module.security-group-alb.security_group_id
  }
}

output "security_groups_vpc_id" {
  description = "The VPC ID"
  value = {
    "ec2" = module.security-group-ec2.security_group_vpc_id,
    "alb" = module.security-group-alb.security_group_vpc_id
  }
}

output "security_groups_owner_id" {
  description = "The owner ID"
  value = {
    "ec2" = module.security-group-ec2.security_group_owner_id,
    "alb" = module.security-group-alb.security_group_owner_id
  }
}

output "security_groups_name" {
  description = "The name of the security group"
  value = {
    "ec2" = module.security-group-ec2.security_group_name,
    "alb" = module.security-group-alb.security_group_name
  }
}

output "security_groups_description" {
  description = "The description of the security group"
  value = {
    "ec2" = module.security-group-ec2.security_group_description,
    "alb" = module.security-group-alb.security_group_description
  }
}

#---------------------------------------------------------------------------------------------------
# IAM Instance Profile
#---------------------------------------------------------------------------------------------------
output "iam_instance_profile_arn" {
  description = "The ARN of the IAM Instance Profile"
  value       = module.iam-instance-profile.iam_instance_profile_arn
}

output "iam_instance_profile_id" {
  description = "The ID of the IAM Instance Profile"
  value       = module.iam-instance-profile.iam_instance_profile_id
}

output "iam_instance_profile_name" {
  description = "The Name of the IAM Instance Profile"
  value       = module.iam-instance-profile.iam_instance_profile_name
}

#---------------------------------------------------------------------------------------------------
# Auto Scaling Group
#---------------------------------------------------------------------------------------------------
output "launch_template_id" {
  description = "ID of the created Launch Template"
  value       = module.autoscaling.launch_template_id
}

output "launch_template_arn" {
  description = "ARN of the created Launch Template"
  value       = module.autoscaling.launch_template_arn
}

output "launch_template_latest_version" {
  description = "Latest version of the created Launch Template"
  value       = module.autoscaling.launch_template_latest_version
}

output "autoscaling_group_id" {
  description = "ID of the created Auto Scaling Group"
  value       = module.autoscaling.autoscaling_group_id
}

output "autoscaling_group_arn" {
  description = "ARN of the created Auto Scaling Group"
  value       = module.autoscaling.autoscaling_group_arn
}

#---------------------------------------------------------------------------------------------------
# Others
#---------------------------------------------------------------------------------------------------
output "ssm_session" {
  description = "Command to start ssm session"
  value       = "aws --profile lab --region ${local.region} ssm start-session --target <INSTANCE_ID>"
}
