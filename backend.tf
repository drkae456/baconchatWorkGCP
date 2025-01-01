terraform {
  backend "gcs" {
    bucket = "bcp_pipeline_bucket"
  }
}