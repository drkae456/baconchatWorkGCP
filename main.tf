resource "google_project_service" "enable_apis" {
  for_each = toset([
    "compute.googleapis.com",
    "container.googleapis.com",
    "iam.googleapis.com",
    "containerregistry.googleapis.com",
    "servicemanagement.googleapis.com",
    "cloudbuild.googleapis.com",
  ])

  service = each.key
}

resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
  network       = google_compute_network.vpc.id

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  network    = google_compute_network.vpc.id
  subnetwork = google_compute_subnetwork.subnet.id

  initial_node_count = 1

  node_config {
    machine_type = "e2-medium"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = var.node_pool_name
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = 1

  node_config {
    machine_type = "e2-medium"
    preemptible  = false
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    google_container_cluster.primary
  ]
}

resource "kubernetes_deployment" "webapp" {
  metadata {
    name = var.deployment_name
    labels = {
      app = "webapp"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "webapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "webapp"
        }
      }

      spec {
        container {
          name  = "webapp"
          image = var.image_name

          port {
            container_port = 80
          }

          env {
            name  = "NODE_ENV"
            value = "production"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "webapp_service" {
  metadata {
    name = "webapp-service"
  }

  spec {
    type = "LoadBalancer"

    selector = {
      app = "webapp"
    }

    port {
      port        = 80
      target_port = 80
    }
  }
}
