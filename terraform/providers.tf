provider "aws" {
  region  = var.region
  profile = "default"
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}
