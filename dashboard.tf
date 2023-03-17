resource "kubernetes_namespace" "dashboard" {
  metadata {
    name = "kubernetes-dashboard"

    labels = {
      "app.kubernetes.io/instance" = "kubernetes-dashboard"

      "app.kubernetes.io/name" = "kubernetes-dashboard"
    }
  }
}
resource "helm_release" "dashboard" {
  chart = "kubernetes-dashboard"
  repository = "https://kubernetes.github.io/dashboard"
  name = "dashboard"
  namespace = kubernetes_namespace.dashboard.metadata[0].name
}

resource "kubernetes_service_account" "admin" {
  depends_on = [helm_release.dashboard]
  metadata {
    name = "admin-user"
    namespace = kubernetes_namespace.dashboard.metadata[0].name
  }
  secret {
    name = "admin-user-token-secret"
  }
  automount_service_account_token = true
}

resource "kubernetes_secret" "admin_user_token" {
  depends_on = [helm_release.dashboard, kubernetes_service_account.admin]
  metadata {
    name = "admin-user-token-secret"
    namespace = kubernetes_namespace.dashboard.metadata[0].name
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account.admin.metadata[0].name
    }
  }
  type = "kubernetes.io/service-account-token"
}



resource "kubernetes_cluster_role_binding" "admin" {
  metadata {
    name = "admin-user"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind = "ClusterRole"
    name = "cluster-admin"
  }
  subject {
    kind = "ServiceAccount"
    name = kubernetes_service_account.admin.metadata[0].name
    namespace = kubernetes_namespace.dashboard.metadata[0].name
  }
}