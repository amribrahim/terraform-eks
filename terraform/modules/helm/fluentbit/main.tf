resource "helm_release" "fluentbit" {
  name       = "fluentbit"
  repository = "https://fluent.github.io/helm-charts"
  chart      = "fluent-bit"
  version    = "0.20.0"
  namespace  = "logging"

  set {
    name  = "filter.kubernetes"
    value = "kubernetes"
  }

  set {
    name  = "input.tail.path"
    value = "/var/log/containers/*_ambassador-*.log"
  }

  set {
    name  = "output.elasticsearch.host"
    value = "elasticsearch.example.com"  # Replace with your Elasticsearch host
  }

  set {
    name  = "output.elasticsearch.port"
    value = "9200"
  }

  set {
    name  = "affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight"
    value = "1"
  }

  set {
    name  = "affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.topologyKey"
    value = "kubernetes.io/hostname"
  }

  set {
    name  = "affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].key"
    value = "app"
  }

  set {
    name  = "affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].operator"
    value = "In"
  }

  set {
    name  = "affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].values[0]"
    value = "grafana"
  }
}
