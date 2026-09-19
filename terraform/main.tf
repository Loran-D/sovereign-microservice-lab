resource "kubernetes_namespace" "sovereign_ns" {
  metadata {
    name = var.namespace
    labels = {
      name       = var.namespace
      tier       = "sovereign-platform"
      managed-by = "terraform"
    }
  }
}

resource "helm_release" "sovereign_app" {
  name             = var.release_name
  chart            = "../helm/sovereign-app"
  namespace        = kubernetes_namespace.sovereign_ns.metadata[0].name
  create_namespace = false

  set {
    name  = "replicaCount"
    value = var.replica_count
  }

  set {
    name  = "env.ENVIRONMENT"
    value = var.environment
  }
}
