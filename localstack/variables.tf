variable "environment" {
  description = "Environment name"
  default     = "production"
}

variable "node_instance_type" {
  description = "EC2 instance type for Web3 node"
  default     = "t3.medium"
}

variable "allowed_rpc_cidrs" {
  description = "CIDRs allowed to access RPC"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
