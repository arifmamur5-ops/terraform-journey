# Terraform Journey: Infrastructure as Code (IaC) Fundamentals

This repository contains my hands-on learning module for Terraform fundamentals. It demonstrates the core principles of Infrastructure as Code (IaC) using the Terraform Docker Provider to spin up, modify, and destroy containerized applications deterministically.

##Core IaC Concepts Learned

1. **Declarative Configuration:** Defining infrastructure blueprints inside `.tf` files using HashiCorp Configuration Language (HCL).
2. **Immutable Infrastructure:** Understanding that infrastructure updates (like changing ports) should destroy and recreate resources (`-/+` replace) rather than mutating them in place.
3. **State Management:** Learning how Terraform uses the `terraform.tfstate` file as its "memory" to map real-world resources to the local configuration. *(Note: This file is securely ignored via `.gitignore` to prevent credential leaks).*

## Workflow & Lifecycle Commands

Below is the standard lifecycle workflow implemented in this project:

```bash
# 1. Initialize the project and download required providers
terraform init

# 2. Preview the execution plan (Dry Run)
terraform plan

# 3. Create and deploy the infrastructure automatically
terraform apply

# 4. View managed resources inside the state file
terraform state list

# 5. Destroy all managed infrastructure completely
terraform destroy


## Tech Stack
- ​OS: Arch Linux
​- IaC Tool: Terraform v1.x
​- Target Provider: Docker Engine
​- Deployed Stack: Nginx (Web Server)
