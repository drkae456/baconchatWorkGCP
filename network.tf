
resource "google_compute_network" "vpc" {
  count                   = try(data.google_compute_network.existing_vpc.id, null) == null ? 1 : 0
  name                    = var.vpc_name
  auto_create_subnetworks = false
  project                 = var.project_id
  depends_on             = [google_project_service.services]
}



# Create subnet only if lookup fails
resource "google_compute_subnetwork" "subnet" {
  count         = try(data.google_compute_subnetwork.existing_subnet.id, null) == null ? 1 : 0
  name          = var.subnet_name
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = try(data.google_compute_network.existing_vpc.id, google_compute_network.vpc[0].id)
  project       = var.project_id
}
