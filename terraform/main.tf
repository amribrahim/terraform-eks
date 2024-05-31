module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source          = "./modules/eks"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.subnet_ids
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
}

module "node_group" {
  source          = "./modules/node_group"
  cluster_name    = module.eks.cluster_name
  node_group_name = var.node_group_name
  subnet_ids      = module.vpc.subnet_ids
}

module "ambassador" {
  source          = "./modules/helm/ambassador"
  cluster_name    = module.eks.cluster_name
  kubeconfig_path = var.kubeconfig_path
}

module "fluentbit" {
  source          = "./modules/helm/fluentbit"
  cluster_name    = module.eks.cluster_name
  kubeconfig_path = var.kubeconfig_path
}

module "grafana" {
  source          = "./modules/helm/grafana"
  cluster_name    = module.eks.cluster_name
  kubeconfig_path = var.kubeconfig_path
  ambassador_host = module.ambassador.ambassador_host
}
