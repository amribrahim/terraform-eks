resource "helm_release" "ambassador" {
  name       = "ambassador"
  repository = "https://getambassador.io"
  chart      = "ambassador"
  version    = "6.7.14"
  namespace  = "ambassador"

  set {
    name  = "replicaCount"
    value = "3"
  }
}

resource "kubernetes_service" "ambassador" {
  metadata {
    name      = "ambassador"
    namespace = "ambassador"
    labels = {
      app = "ambassador"
    }
  }

  spec {
    selector = {
      app = "ambassador"
    }

    port {
      port        = 443
      target_port = 8443
      protocol    = "TCP"
    }

    type = "LoadBalancer"
  }
}
