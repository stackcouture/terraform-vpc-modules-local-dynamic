output "public_subnets" {
  value = [for subnet in aws_subnet.public_subnets : subnet.id]
}

output "private_subnets" {
  value = [for subnet in aws_subnet.private_subnets : subnet.id]
}

output "az_names" {
  value = [for az in data.aws_availability_zones.avail_zones.names : az]
}
