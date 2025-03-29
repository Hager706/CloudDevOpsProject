variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "jenkins_master_ami" {
  description = "AMI for Jenkins Master"
  default     = "ami-05b10e08d247fb927"  # Replace with actual AMI
}

variable "jenkins_slave_ami" {
  description = "AMI for Jenkins Slave"
  default     = "ami-05b10e08d247fb927"  # Replace with actual AMI
}

variable "instance_type" {
  default = "t2.medium"
}