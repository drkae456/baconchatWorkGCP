# First, create a provider without project specified for project creation
provider "google" {
  region = var.region
}

# Create the project
resource "google_project" "project" {
  project_id      = var.project_id
  billing_account = var.billing_account_id
}

# Configure provider with project for other resources
provider "google" {
  alias   = "project"
  project = google_project.project.project_id
  region  = var.region
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

# Enable required APIs
resource "google_project_service" "services" {
  provider = google.project
  for_each = toset([
    "compute.googleapis.com",
    "container.googleapis.com",
    "containerregistry.googleapis.com"
  ])
  
  project = google_project.project.project_id
  service = each.key

  disable_dependent_services = true
  disable_on_destroy        = false
}
