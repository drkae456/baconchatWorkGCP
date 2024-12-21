variable "project_id" {
  description = "The ID of the GCP project (must be unique)"
  type        = string
}

variable "region" {
  description = "The default GCP region"
  type        = string
  default     = "australia-southeast1"
}

variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "node_pool_name" {
  description = "Name of the GKE node pool"
  type        = string
}

variable "billing_account_id" {
  description = "The billing account ID to associate with the project"
  type        = string
} 