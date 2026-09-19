variable "release_name" {
  type        = string
  default     = "sovereign-app-tf"
  description = "Name of the Helm release provisioned by Terraform"
}

variable "namespace" {
  type        = string
  default     = "sovereign-system"
  description = "Kubernetes namespace for sovereign workload isolation"
}

variable "replica_count" {
  type        = number
  default     = 2
  description = "Number of pod replicas to deploy"
}

variable "environment" {
  type        = string
  default     = "k3s-sovereign-tf"
  description = "Deployment environment identifier"
}
