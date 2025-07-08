locals {
  public_subnet_name = "${terraform.workspace}-public-subnet" # Automatically uses the current workspace
}

locals {
  private_subnet_name = "${terraform.workspace}-private-subnet" # Automatically uses the current workspace
}