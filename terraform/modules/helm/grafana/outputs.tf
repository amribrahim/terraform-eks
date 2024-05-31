output "grafana_url" {
  value = "https://${helm_release.grafana.release_name.metadata.0.labels.ingress-name}"
}
