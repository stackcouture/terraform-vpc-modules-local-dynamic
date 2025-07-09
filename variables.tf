# VPC Variables
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR Block"
}

variable "instance_tenancy" {
  type        = string
  description = "VPC Instance Tenancy"
}

variable "vpc_name" {
  type        = string
  description = "VPC Name"
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS Support"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS Hostnam"
}

# IGG 

variable "igw_name" {
  type        = string
  description = "Internet Gateway Name"
}

variable "sg_name" {
  type        = string
  description = "Security group name"
}

# NAT Gateway 

variable "nat_gw_name" {
  type        = string
  description = "NAT Gateway Name"
}


# EC2 Instance 

variable "instance_type" {
  type        = string
  description = "Instance Type"
}

variable "instance_tag" {
  type        = string
  description = "Instance Tag"
}

variable "private_instance_tag" {
  type        = string
  description = "Private Instance Tag"
}