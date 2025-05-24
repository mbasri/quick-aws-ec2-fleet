#---------------------------------------------------------------------------------------------------
# VPC
#---------------------------------------------------------------------------------------------------
module "vpc" {
  source = "git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-vpc?ref=v1.7.1"

  vpc_name = local.vpc_name

  kms_arn = module.kms.key_arn

  enable_nat_gateway = true

  enable_system_logs = true
  enable_spot_logs   = true

  enable_cloudwatch_vpc_flow_logs = false
  bucket_arn_vpc_flow_logs        = null #"arn:aws:s3:::<BUCKET_NAME>"
  bucket_arn_resolvers_logs       = null #"arn:aws:s3:::<BUCKET_NAME>"

  vpc_cidr = "10.0.0.0/24"

  availability_zones = ["eu-west-3a", "eu-west-3b"]

  public_subnet_cidr  = ["10.0.0.0/28", "10.0.0.16/28"]
  private_subnet_cidr = ["10.0.0.128/26", "10.0.0.192/26"]
  secure_subnet_cidr  = ["10.0.0.64/27", "10.0.0.96/27"]
  vpn_subnet_cidr     = []
  spare_subnet_cidr   = ["10.0.0.32/28", "10.0.0.48/28"]

  tags = local.tags
}
