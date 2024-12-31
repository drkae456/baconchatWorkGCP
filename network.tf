# Create VPC only if it doesn't exist
resource "google_compute_network" "vpc" {
  count                   = data.google_compute_network.existing_vpc.id != null ? 0 : 1
  name                    = var.vpc_name
  auto_create_subnetworks = false
  project                 = var.project_id

  depends_on = [google_project_service.services]
}

# Data source to check if VPC exists
data "google_compute_network" "existing_vpc" {
  name    = var.vpc_name
  project = var.project_id
}

# Create subnet only if it doesn't exist
resource "google_compute_subnetwork" "subnet" {
  count         = data.google_compute_subnetwork.existing_subnet.id != null ? 0 : 1
  name          = var.subnet_name
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = data.google_compute_network.existing_vpc.id != null ? data.google_compute_network.existing_vpc.id : google_compute_network.vpc[0].id
  project       = var.project_id
}

# Data source to check if subnet exists
data "google_compute_subnetwork" "existing_subnet" {
  name    = var.subnet_name
  region  = var.region
  project = var.project_id
} 