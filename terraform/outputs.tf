output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_id" {
  value = module.eks.cluster_id
}

output "node_group_id" {
  value = module.node_group.node_group_id
}

output "grafana_url" {
  value = module.grafana.grafana_url
}
