output "namespace" {
  value       = kubernetes_namespace.sovereign_ns.metadata[0].name
  description = "The isolated Kubernetes namespace created by Terraform"
}

output "helm_release_status" {
  value       = helm_release.sovereign_app.status
  description = "Status of the Terraform-managed Helm release"
}
