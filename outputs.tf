output "public_subnets_ids" {
  value = module.subnet.public_subnets
}

output "private_subnet_ids" {
  value = module.subnet.private_subnets
}