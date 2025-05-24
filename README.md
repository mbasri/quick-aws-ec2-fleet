<!-- BEGIN_TF_DOCS -->
# Quick AWS EC2 Fleet

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Terraform project which create VPC and Auto Scaling Group resource on AWS from scratch

## *Create and destroy the infrastructure*

### 1. Create infrastructure

```shell
git clone https://github.com/mbasri/quick-aws-ec2-fleet.git
cd quick-aws-ec2-fleet
terraform init
terraform apply
```

### 2. Destroy infrastructure

```shell
git clone https://github.com/mbasri/quick-aws-ec2-fleet.git
cd quick-aws-ec2-fleet
terraform init
terraform destroy
```

## *Use the EC2 instance*

### 1. Connect to the EC2 instance

See the Terrafom output 'ssm_session'

## *Generate docs*

```shell
terraform-docs -c .terraform-docs.yml .
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.10.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.81.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.81.0 |
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_autoscaling"></a> [autoscaling](#module\_autoscaling) | ../../../gitlab.com/mbasri-terraform/modules*aws/terraform-aws-autoscaling | n/a |
| <a name="module_iam-instance-profile"></a> [iam-instance-profile](#module\_iam-instance-profile) | git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-iam-instance-profile | v1.2.0 |
| <a name="module_kms"></a> [kms](#module\_kms) | git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-kms | v1.3.0 |
| <a name="module_security-group"></a> [security-group](#module\_security-group) | git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-security-group | v1.2.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-vpc | v1.7.1 |

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.main](https://registry.terraform.io/providers/hashicorp/aws/5.81.0/docs/resources/ssm_parameter) | resource |
| [cloudinit_config.main](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_autoscaling_group_arn"></a> [autoscaling\_group\_arn](#output\_autoscaling\_group\_arn) | ARN of the created Auto Scaling Group |
| <a name="output_autoscaling_group_id"></a> [autoscaling\_group\_id](#output\_autoscaling\_group\_id) | ID of the created Auto Scaling Group |
| <a name="output_default_security_group_id"></a> [default\_security\_group\_id](#output\_default\_security\_group\_id) | The ID of the VPC default security group |
| <a name="output_iam_instance_profile_arn"></a> [iam\_instance\_profile\_arn](#output\_iam\_instance\_profile\_arn) | The ARN of the IAM Instance Profile |
| <a name="output_iam_instance_profile_id"></a> [iam\_instance\_profile\_id](#output\_iam\_instance\_profile\_id) | The ID of the IAM Instance Profile |
| <a name="output_iam_instance_profile_name"></a> [iam\_instance\_profile\_name](#output\_iam\_instance\_profile\_name) | The Name of the IAM Instance Profile |
| <a name="output_key_alias_arn"></a> [key\_alias\_arn](#output\_key\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_key_alias_name"></a> [key\_alias\_name](#output\_key\_alias\_name) | Name of the key alis |
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | Name of the key |
| <a name="output_key_policy"></a> [key\_policy](#output\_key\_policy) | The IAM resource policy set on the key |
| <a name="output_launch_template_arn"></a> [launch\_template\_arn](#output\_launch\_template\_arn) | ARN of the created Launch Template |
| <a name="output_launch_template_id"></a> [launch\_template\_id](#output\_launch\_template\_id) | ID of the created Launch Template |
| <a name="output_launch_template_latest_version"></a> [launch\_template\_latest\_version](#output\_launch\_template\_latest\_version) | Latest version of the created Launch Template |
| <a name="output_nat_gateway_public_ips"></a> [nat\_gateway\_public\_ips](#output\_nat\_gateway\_public\_ips) | Private IP of NAT Gateway |
| <a name="output_private_subnet_cidr"></a> [private\_subnet\_cidr](#output\_private\_subnet\_cidr) | List of cidr\_blocks of private subnets |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | List of IDs of private subnets |
| <a name="output_public_subnet_cidr"></a> [public\_subnet\_cidr](#output\_public\_subnet\_cidr) | List of cidr\_blocks of public subnets |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | List of IDs of public subnets |
| <a name="output_region"></a> [region](#output\_region) | The Name of the region |
| <a name="output_secure_subnet_cidr"></a> [secure\_subnet\_cidr](#output\_secure\_subnet\_cidr) | List of cidr\_blocks of secure subnets |
| <a name="output_secure_subnet_ids"></a> [secure\_subnet\_ids](#output\_secure\_subnet\_ids) | List of IDs of secure subnets |
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | The ARN of the security group |
| <a name="output_security_group_description"></a> [security\_group\_description](#output\_security\_group\_description) | The description of the security group |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | The name of the security group |
| <a name="output_security_group_owner_id"></a> [security\_group\_owner\_id](#output\_security\_group\_owner\_id) | The owner ID |
| <a name="output_security_group_vpc_id"></a> [security\_group\_vpc\_id](#output\_security\_group\_vpc\_id) | The VPC ID |
| <a name="output_spot_logs_cwl_id"></a> [spot\_logs\_cwl\_id](#output\_spot\_logs\_cwl\_id) | The IDs of the cloudwatch logs for Spot logging |
| <a name="output_ssm_session"></a> [ssm\_session](#output\_ssm\_session) | Command to start ssm session |
| <a name="output_system_logs_cwl_id"></a> [system\_logs\_cwl\_id](#output\_system\_logs\_cwl\_id) | The IDs of the cloudwatch logs for VM system logs |
| <a name="output_vpc_cidr_blocks"></a> [vpc\_cidr\_blocks](#output\_vpc\_cidr\_blocks) | The CIDR block of the VPC |
| <a name="output_vpc_flow_logs_cwl_id"></a> [vpc\_flow\_logs\_cwl\_id](#output\_vpc\_flow\_logs\_cwl\_id) | The ID of the cloudwatch logs for VPC flow logs |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |

## *Author*

* [**Mohamed BASRI**](https://github.com/mbasri)

## *License*

This is free and unencumbered software released into the public domain - see the [LICENSE](./LICENSE) file for details

<!-- END_TF_DOCS -->