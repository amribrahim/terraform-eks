variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
}

variable "ambassador_host" {
  description = "Ambassador Edge Stack host"
  type        = string
}
