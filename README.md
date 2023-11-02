# AWS Playground: ELK Stack Deployment

This repository focuses on the integration and deployment of the ELK Stack (Elasticsearch, Logstash, and Kibana) using Terraform and Amazon Web Services (AWS). Intended as both a practical guide and comprehensive documentation, it details the entire process—from setup to deployment, while highlighting challenges and intricacies of integrating these technologies.

While this project is experimental and not designed for production use, it offers invaluable insights and showcases best practices for ELK stack deployment on AWS.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [AWS CLI Setup](#aws-cli-setup)
- [Terraform Installation](#terraform-installation)

## Prerequisites

- An active AWS account
- AWS CLI configured on your machine
- Terraform installed on your machine
- A foundational understanding of AWS services, Elasticsearch, and Terraform

## Getting Started

1. **AWS Account Creation**: If you don’t already have an AWS account, sign up [here](https://aws.amazon.com/).
2. **IAM User Setup**: Create a new IAM user in your AWS account, ensuring you attach the `AmazonEC2FullAccess` policy for the necessary permissions. Follow this [guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html) for assistance.
3. **EC2 Key Pair Creation**: Generate an EC2 key pair for SSH access to your instances. Here's a handy [guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html).
4. **Configure EC2 Security Group**: Set up a security group with the appropriate rules. If using IPv6, modify your VPC to include an IPv6 CIDR block. For guidance, refer to this [guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html).
5. **Initiate EC2 Instance**: Deploy a `t2.micro` EC2 instance using a Debian AMI. Ensure you select the key pair and security group created earlier. Use this [guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html) for help.

## AWS CLI Setup

First, install the AWS CLI and configure it with your credentials:

sudo apt-get install -y awscli
aws configure

Should you encounter errors related to DEFAULT_CIPHERS, run:

python -m pip install requests "urllib3<2"

## Terraform Installation

Follow these steps to install Terraform:

sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update && sudo apt-get install -y terraform
