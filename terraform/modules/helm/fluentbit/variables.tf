variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
}
