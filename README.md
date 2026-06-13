# Terraform Journey

Infrastructure as Code (IaC) for Web3 node deployment.

## Projects

### 1. Docker Provider (Basic)
Location: `docker/`
- Deploy Nginx container via Terraform
- Demonstrates immutable infrastructure concept
- Port modification triggers destroy + recreate

### 2. LocalStack (AWS Simulation)
Location: `localstack/`
- Simulates AWS S3 + IAM locally without cloud account
- S3 bucket for Web3 node config storage
- IAM role for EC2 instance permissions
- Variables and tfvars for environment management

## Key Concepts Learned
- `terraform init` → download providers
- `terraform plan` → preview changes
- `terraform apply` → apply changes
- `terraform destroy` → remove all resources
- `terraform.tfstate` → never commit to public repo
- Immutable infrastructure: modify = destroy + recreate
- Variables vs hardcoded values

## Security Notes
- `terraform.tfstate` excluded via `.gitignore`
- `.terraform/` excluded via `.gitignore`
- RPC CIDR restricted to `10.0.0.0/8` in production

## Stack
- Terraform v1.15.5
- AWS Provider v5.100.0
- Docker Provider v3.x
- LocalStack v3.8.1 (community)