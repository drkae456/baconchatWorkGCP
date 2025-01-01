terraform {
  backend "gcs" {
    bucket = "BCP_PIPELINE_BUCKET"
    prefix = "terraform/state"
  }
}