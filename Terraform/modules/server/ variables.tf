
variable "project_name" {
  description = "Name of the project"
  type        = string
}


variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "IDs of subnets"
  type        = list(string)
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 2
}

variable "app_port" {
  description = "Port the application runs on"
  type        = number
  default     = 8080
}
variable "ami" {
  description = "UBUNTU" 
  type        = string
  default     = "ami-084568db4383264d4" # Update for your region
}