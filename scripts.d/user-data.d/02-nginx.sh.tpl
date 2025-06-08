#!/usr/bin/env bash

#---------------------------------------------------------------------------------------------------
# Init Metadatas
#---------------------------------------------------------------------------------------------------
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 1800"`
INSTANCE_ID=`curl -H "X-aws-ec2-metadata-token: $${TOKEN}" --retry 5 -q http://169.254.169.254/latest/meta-data/instance-id`
PRIVATE_IP=$(curl -H "X-aws-ec2-metadata-token: $${TOKEN}" --retry 5 -q http://169.254.169.254/latest/meta-data/local-ipv4)

#---------------------------------------------------------------------------------------------------
# Nginx
#---------------------------------------------------------------------------------------------------
yum install -y nginx || apt-get update && apt-get install -y nginx

systemctl enable nginx
systemctl start nginx

echo "<h1>$${PRIVATE_IP}</h1>" > /usr/share/nginx/html/index.html