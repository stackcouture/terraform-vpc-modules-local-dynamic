# terraform-vpc-modules-local-dynamic

🧱 A Terraform project demonstrating how to dynamically create a VPC and related AWS networking components using **modules** and **local values**.

## 📌 Overview

This repository showcases a modular and dynamic approach to provisioning a **Virtual Private Cloud (VPC)** in AWS using Terraform. It leverages:

- **Local values** for flexible configurations.
- **Modules** to promote reusability and clean code.
- **Dynamic blocks** for scalable resource creation.

Ideal for those looking to standardize and automate AWS network infrastructure with infrastructure-as-code (IaC) practices.

---

## 📂 Project Structure

```bash
terraform-vpc-modules-local-dynamic/
├── modules/
│   ├── vpc/                # Reusable VPC module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/                # Reusable EC2 module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── igw/                # Internet Gateway module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── nat/                # NAT Gateway module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── rt/                 # Route Table module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── subnets/            # Subnet module
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── env/
│   ├── dev.tfvars          # Dev environment vars
│   ├── stage.tfvars        # Stage environment vars
│   └── prod.tfvars         # Prod environment vars
│
├── versions.tf             # Terraform & provider versions
├── README.md               # You're here!



🧠 Design Principles

    Reusability through modularization
    Flexibility via local values and variable maps
    Separation of environments with workspace + tfvars
    Scalable for production-ready infrastructure setups


Manage Terraform Workspaces

This project uses Terraform Workspaces to manage multiple environment configurations (dev, prod, stage). Each environment has its own .tfvars file under the envs/ directory.


🧪 Dev Environment

terraform workspace new dev 
terraform workspace select dev
workspace=$(terraform workspace show)
terraform plan -out="$workspace-tfplan" -var-file="envs/$workspace.tfvars"
terraform apply "$workspace-tfplan"
terraform destroy -auto-approve 

🚀 Prod Environment

terraform workspace new prod 
terraform workspace select prod
workspace=$(terraform workspace show)
terraform plan -out="$workspace-tfplan" -var-file="envs/$workspace.tfvars"
terraform apply "$workspace-tfplan"

🛠️ Stage Environment

terraform workspace new stage 
terraform workspace select stage
workspace=$(terraform workspace show)
terraform plan -out="$workspace-tfplan" -var-file="envs/$workspace.tfvars"
terraform apply "$workspace-tfplan"


✅ Prerequisites

    Terraform ≥ 1.3
    AWS CLI configured with access to networking resources
    Valid AWS credentials (~/.aws/credentials or environment variables)

📤 Outputs

Typical module outputs (will vary depending on usage):

vpc_id
subnet_ids
route_table_ids
nat_gateway_id
instance_ids


