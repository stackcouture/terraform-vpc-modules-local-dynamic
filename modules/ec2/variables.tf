variable "instance_type" {
  type        = string
  description = "Instance Type"
}

variable "instance_tag" {
  type        = string
  description = "Instance Tag"
}

variable "sg_id" {
  type        = string
  description = "Security Group ID"
}

variable "az_ids" {
  type = list(string)
}

variable "private_instance_tag" {
  type        = string
  description = "Private Instance Tag"
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string) # A list of strings (subnet IDs)
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of Private Subnet IDs"
}