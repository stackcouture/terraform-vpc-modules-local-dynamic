resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = local.public_rt_name
  }
}


resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = local.private_rt_name
  }
}

resource "aws_route_table_association" "public_rt_association" {
  for_each       = { for idx, subnet_id in var.public_subnet_ids : idx => subnet_id } # Convert list to map
  subnet_id      = each.value
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt_association" {
  for_each       = { for idx, subnet_id in var.private_subnet_ids : idx => subnet_id } # Convert list to map
  subnet_id      = each.value
  route_table_id = aws_route_table.private_rt.id
}