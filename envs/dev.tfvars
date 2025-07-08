#VPC 
vpc_cidr             = "10.17.0.0/24"
instance_tenancy     = "default"
vpc_name             = "My"
enable_dns_support   = true
enable_dns_hostnames = true

#IGW 
igw_name = "VPC-IGW"
sg_name = "Web-SG" 
nat_gw_name = "NAT-GW"


# EC2 Instance 

instance_type = "t2.micro"
instance_tag  = "public-server"
private_instance_tag = "rrivate-server"

