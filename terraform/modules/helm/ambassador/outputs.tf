output "ambassador_host" {
  value = kubernetes_service.ambassador.status[0].load_balancer[0].ingress[0].hostname
}
