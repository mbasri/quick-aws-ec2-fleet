#---------------------------------------------------------------------------------------------------
# Save cloudwatch Agent configuration
# https://docs.aws.amazon.com/fr_fr/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html
#
# https://docs.aws.amazon.com/fr_fr/AmazonCloudWatch/latest/monitoring/create-cloudwatch-agent-configuration-file-wizard.html
# ex: sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
#
# Used by user-data
#---------------------------------------------------------------------------------------------------
resource "aws_ssm_parameter" "main" {
  name        = local.ssm_parameter_name
  description = local.description
  type        = "String"
  value = templatefile("${path.module}/ssm.d/01-cloudwatch-agent.json", {
    vpc_id = module.vpc.vpc_id
  })
  tags = merge(local.tags, tomap({ "Name" = local.ssm_parameter_name }))
  tier = "Advanced"
}
