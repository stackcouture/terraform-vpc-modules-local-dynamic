variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "nat_gw_name" {
  type        = string
  description = "NAT Gateway Name"
}

variable "iwg_id" {
  type        = string
  description = "IGW"
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}