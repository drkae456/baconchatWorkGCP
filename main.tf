resource "google_project" "project" {
  name = var.project_id
  project_id = var.project_id

  billing_account = var.billing_account_id

  auto_create_network = true
} 
