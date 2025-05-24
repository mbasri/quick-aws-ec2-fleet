#!/usr/bin/env bash

#---------------------------------------------------------------------------------------------------
# EC2 Init
#---------------------------------------------------------------------------------------------------
sudo cloud-init-per once dnf_update_kernel dnf update kernel -y
sudo cloud-init-per once dnf_update dnf update expat -y
sudo cloud-init-per once dnf_update_security dnf update --security -y

sudo cloud-init-per once dns_install dnf install -y wget telnet bind-utils jq docker python3-pip git unzip
sudo cloud-init-per once remove_awscli_v1 dnf remove -y awscli

sudo cloud-init-per once get_awscliv2 curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
sudo cloud-init-per once unzip_awscliv2 unzip awscliv2.zip
sudo cloud-init-per once install_awscliv2 ./aws/install -i /usr/local/aws-cli -b /bin --update
sudo cloud-init-per once remove_awscliv2_zip_file rm -rf awscliv2.zip aws

#---------------------------------------------------------------------------------------------------
# Cloudwatch Agent
#---------------------------------------------------------------------------------------------------
sudo cloud-init-per once get_collecd dnf install -y collectd

sudo cloud-init-per once get_cloudwatch_agent wget https://s3.amazonaws.com/amazoncloudwatch-agent/centos/amd64/latest/amazon-cloudwatch-agent.rpm
sudo cloud-init-per once install_cloudwatch_agent rpm -U --replacepkgs ./amazon-cloudwatch-agent.rpm
sudo cloud-init-per once remove_cloudwatch_agent_rpm rm -f amazon-cloudwatch-agent.rpm

sudo cloud-init-per always start_cloudwatch_agent /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c ssm:${ssm_parameter_name} -s
