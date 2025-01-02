variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}



variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
  default     = "webapp-vpc"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "webapp-subnet"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "webapp-cluster"
}

variable "node_pool_name" {
  description = "Name of the node pool"
  type        = string
  default     = "webapp-node-pool"
}

variable "deployment_name" {
  description = "Kubernetes deployment name"
  type        = string
  default     = "webapp"
}

variable "image_name" {
  description = "Docker image name"
  type        = string
}

variable "gcp_credentials" {
  description = "The GCP service account key in JSON format"
  type        = string
}