terraform {
  backend "gcs" {
    bucket = "your-terraform-state-bucket-name"
    prefix = "terraform/state"
  }
}