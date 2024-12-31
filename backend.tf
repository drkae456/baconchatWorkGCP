terraform {
  backend "gcs" {
    bucket  = var.gcp_bucket_name
    prefix  = "terraform/state"
    project = var.project_id
    region  = var.region
  }
}