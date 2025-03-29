provider "aws" {
  region = var.region
}


# Network Module
module "network" {
  source = "./modules/network"
  
  vpc_cidr_block     = var.vpc_cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

# Servers Module
module "jenkins_servers" {
  source = "./modules/server"
  
  jenkins_master_ami     = var.jenkins_master_ami
  jenkins_slave_ami      = var.jenkins_slave_ami
  instance_type          = var.instance_type
  subnet_id              = module.network.public_subnet_id
  vpc_security_group_ids = [module.network.security_group_id]
}