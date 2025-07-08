variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "internet_gateway_id" {
  type        = string
  description = "Internet Gateway Id"
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string) # A list of strings (subnet IDs)
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of Private Subnet IDs"
}

variable "nat_gateway_id" {
  type        = string
  description = "NAT Gateway ID"
}