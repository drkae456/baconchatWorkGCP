# Create VPC
resource "google_compute_network" "vpc" {
  provider                = google.project
  name                    = var.vpc_name
  auto_create_subnetworks = false
  project                 = google_project.project.project_id

  depends_on = [google_project_service.services]
}

# Create subnet
resource "google_compute_subnetwork" "subnet" {
  provider      = google.project
  name          = var.subnet_name
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
  project       = google_project.project.project_id
} 