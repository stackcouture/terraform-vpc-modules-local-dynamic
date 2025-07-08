module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  vpc_instance_tenancy = var.instance_tenancy
  vpc_name             = var.vpc_name
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
}

module "igw" {
  source   = "./modules/igw"
  vpc_id   = module.vpc.vpc_id
  igw_name = var.igw_name
}

module "subnet" {
  source       = "./modules/subnets"
  vpc_id       = module.vpc.vpc_id
  cidr_for_vpc = module.vpc.vpc_cidr_block
}

module "rt" {
  source              = "./modules/rt"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.igw.igw_id
  public_subnet_ids   = module.subnet.public_subnets
  private_subnet_ids  = module.subnet.private_subnets
  nat_gateway_id      = module.nat.nat_gateway_id
}

module "sg" {
  source         = "./modules/sg"
  vpc_id         = module.vpc.vpc_id
  vpc_cidr_block = module.vpc.vpc_cidr_block
  sg_name        = var.sg_name
}

module "nat" {
  source            = "./modules/nat"
  vpc_id            = module.vpc.vpc_id
  nat_gw_name       = var.nat_gw_name
  iwg_id            = module.igw.igw_id
  public_subnet_ids = module.subnet.public_subnets
}

module "ec2" {
  source            = "./modules/ec2"
  instance_type     = var.instance_type
  instance_tag      = var.instance_tag
  public_subnet_ids = module.subnet.public_subnets
  private_subnet_ids  = module.subnet.private_subnets
  sg_id             = module.sg.sg_id
  az_ids           = module.subnet.az_names
  private_instance_tag = var.private_instance_tag
}