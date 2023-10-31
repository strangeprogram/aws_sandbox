provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  count = var.instance_count

  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = var.security_group_ids

  user_data = file("init.sh")

  tags = {
    Name = "WebInstance-${count.index + 1}"
  }
}

variable "aws_region" {
  description = "The AWS region to deploy the EC2 instance(s)"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "The type of the EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Name of the AWS Key Pair for SSH access"
  type        = string
}

variable "security_group_ids" {
  description = "List of Security Group IDs to attach to the EC2 instances"
  type        = list(string)
}
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  count = var.instance_count

  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = var.security_group_ids

  user_data = file("init.sh")

  tags = {
    Name = "WebInstance-${count.index + 1}"
  }
}

variable "aws_region" {
  description = "The AWS region to deploy the EC2 instance(s)"
  type        = string
}
