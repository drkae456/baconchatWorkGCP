\variable "project_id" {
  description = "The ID of the GCP project."
  type        = string
}

variable "billing_account_id" {
  description = "The billing account ID."
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources."
  type        = string
  default     = "australiasoutheast2"
}

variable "vpc_name" {
  description = "Name of the VPC network."
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnetwork."
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster."
  type        = string
}

variable "node_pool_name" {
  description = "Name of the GKE node pool."
  type        = string
}

variable "deployment_name" {
  description = "Name of the Kubernetes deployment."
  type        = string
}

variable "image_name" {
  description = "Docker image name."
  type        = string
}
variable "gcp_bucket_name" {
  description = "The name of the GCS bucket for Terraform state."
  type        = string
}