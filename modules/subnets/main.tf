resource "aws_subnet" "public_subnets" {
  vpc_id            = var.vpc_id
  for_each          = { for index, az_name in slice(data.aws_availability_zones.avail_zones.names, 0, 2) : index => az_name }
  cidr_block        = cidrsubnet(var.cidr_for_vpc, length(data.aws_availability_zones.avail_zones.names) > 3 ? 4 : 3, each.key)
  availability_zone = each.value
  tags = {
    Name = "${local.public_subnet_name}-${each.key + 1}" # Sequential names (public-subnet-1, public-subnet-2)
  }
}

resource "aws_subnet" "private_subnets" {
  vpc_id            = var.vpc_id
  for_each          = { for index, az_name in slice(data.aws_availability_zones.avail_zones.names, 0, 2) : index + length(data.aws_availability_zones.avail_zones.names) => az_name }
  cidr_block        = cidrsubnet(var.cidr_for_vpc, length(data.aws_availability_zones.avail_zones.names) > 3 ? 4 : 3, each.key)
  availability_zone = each.value
  tags = {
    Name = "${local.private_subnet_name}-${each.key - 2}" # Sequential names (private-subnet-1, private-subnet-2)
  }
}
