# main.tf

provider "aws" {
  region = var.aws_region
}

# Include variables module
module "variables" {
  source = "./modules/variables"
}

# Security group module
module "security_group" {
  source      = "./modules/security-group"
  name        = var.security_group_name
  description = var.security_group_description
}

# EC2 instance module
module "ec2_instance" {
  source           = "./modules/ec2"
  ami              = var.ami_id
  instance_type    = var.instance_type
  key_name         = var.key_name
  security_group_id = module.security_group.security_group_id
}

# Ansible configuration module
module "ansible" {
  source    = "./modules/ansible"
  public_ip = module.ec2_instance.instance_public_ip
  key_path  = var.ssh_private_key_path
}

# Include outputs module
module "outputs" {
  source = "./modules/outputs"
}
