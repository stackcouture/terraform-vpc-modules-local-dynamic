locals {
  public_rt_name = "${terraform.workspace}-Public-RT" # Automatically uses the current workspace
}

locals {
  private_rt_name = "${terraform.workspace}-Private-RT"
}